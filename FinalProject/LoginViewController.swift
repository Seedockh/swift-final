import UIKit

class LoginViewController: UIViewController, SignUpViewDelegate, SignInViewDelegate, ProfilViewDelegate {
    
    @IBOutlet weak var signInView: SignInView!
    @IBOutlet weak var signUpView: SignUpView!
    @IBOutlet weak var profilView: ProfilView!
    @IBOutlet weak var successLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInView.delegate = self
        signUpView.delegate = self
        profilView.delegate = self
        let notifier = NotificationCenter.default
        notifier.addObserver(self,
                             selector: #selector(keyboardWillShowNotification(_:)),
                             name: UIWindow.keyboardWillShowNotification,
                             object: nil)
        notifier.addObserver(self,
                             selector: #selector(keyboardWillHideNotification(_:)),
                             name: UIWindow.keyboardWillHideNotification,
                             object: nil)
        
    }
    
    @objc
    func keyboardWillShowNotification(_ notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - 370
            }
        }
    }
    
    @objc
    func keyboardWillHideNotification(_ notification: NSNotification) {
        if view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func goToLogin() {
        signUpView.isHidden = true
        signInView.isHidden = false
        profilView.isHidden = true
    }
    
    func goToRegister() {
        signUpView.isHidden = false
        signInView.isHidden = true
        profilView.isHidden = true
    }
    
    func goToProfile() {
        signInView.isHidden = true
        signUpView.isHidden = true
        profilView.displayEmail()
        profilView.isHidden = false
    }
    
    
    func login(email: String, password: String) {
        print("\(email) - \(password)")
    }
    
    func register() {
        if signUpView.checkFields() {
            let email = signUpView.emailTextField.text!
            let password = signUpView.passwordTextField.text!
            let user: User = User(email: email, password: password)
            RegisterUser.instance.register(user: user)
            successLabel.text = ErrorHandler.registerSuccessful.getErrorMessage()
            signUpView.goToLogin()
        }
    }
    
    func login() {
        if signInView.checkFields() {
            successLabel.text = ErrorHandler.loginSuccessful.getErrorMessage()
            goToProfile()
        }
    }

    func changePassword() {
        if profilView.checkFields() {
            if RegisterUser.instance.user?.password == profilView.newPasswordTextField.text! { //same password as old
                successLabel.text = ErrorHandler.changePasswordSameAsOld.getErrorMessage()
            } else {
                RegisterUser.instance.user?.password = profilView.newPasswordTextField.text!
                successLabel.text = ErrorHandler.changePasswordSuccessful.getErrorMessage()
            }
            profilView.newPasswordTextField.text = ""
            profilView.confirmNewPasswordTextField.text = ""
        }
    }
    
    func logout() {
        goToLogin()
    }
}
