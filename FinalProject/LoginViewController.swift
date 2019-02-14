import UIKit

class LoginViewController: UIViewController, SignUpViewDelegate, SignInViewDelegate {
    
    @IBOutlet weak var signInView: SignInView!
    @IBOutlet weak var signUpView: SignUpView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInView.delegate = self
        signUpView.delegate = self
    }
    
    func goToLogin() {
        signUpView.isHidden = true
        signInView.isHidden = false
    }
    
    func goToRegister() {
        signUpView.isHidden = false
        signInView.isHidden = true
    }
    
    func login(email: String, password: String) {
        print("\(email) - \(password)")
    }
    
    func register() {
        guard let email = signUpView.emailTextField.text else { }
        guard let password = signUpView.passwordTextField.text else { }
        guard let confirmPassword = signUpView.confirmPasswordTextField.text else { return }
        
        //print("\(email) - \(password) - \(confirmPassword)")
        
        if (email != "" && password != "" && confirmPassword != "" && password == confirmPassword) {
            signUpView.goToLogin()
            
            let user: User = User(email: email, password: password)
            RegisterUser.instance.register(user: user)
            print("Successful sign up !")
        } else {
            print("Email or password invalid !")
        }
    }
    
    func login() {
        guard let email = signInView.emailTextField.text else { return }
        guard let password = signInView.passwordTextField.text else { return }
        guard let checkedEmail = RegisterUser.instance.user?.email else {
            print("Please register first")
            return
        }
        guard let checkedPassword = RegisterUser.instance.user?.password else {
            print("Please register first")
            return
        }
        
        print(checkedEmail)
        print(checkedPassword)
        
        if (email == checkedEmail && password == checkedPassword) {
            print("Successful login")
        } else {
            print("Unable to find a match with this pair of email/password !")
        }
        
    }
}
