import UIKit

class LoginViewController: UIViewController, SignUpViewDelegate, SignInViewDelegate, ProfilViewDelegate {
    
    @IBOutlet weak var signInView: SignInView!
    @IBOutlet weak var signUpView: SignUpView!
    @IBOutlet weak var profilView: ProfilView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInView.delegate = self
        signUpView.delegate = self
        profilView.delegate = self
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
        profilView.emailDisplay()
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
            print("Successful sign up !")
            signUpView.goToLogin()
        }
    }
    
    func login() {
        if signInView.checkFields() {
            print("Successful login")
            goToProfile()
        }
    }

    func changePassword() {
        if profilView.checkFields() {
            if RegisterUser.instance.user?.password == profilView.newPasswordTextField.text! { //same password
                print("New password isn't really new, is it...")
            } else {
                RegisterUser.instance.user?.password = profilView.newPasswordTextField.text!
                print("Password change is a success")
            }
            profilView.newPasswordTextField.text = ""
            profilView.confirmNewPasswordTextField.text = ""
        }
    }
    
    func logout() {
        goToLogin()
    }
}
