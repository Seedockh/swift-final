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

}
