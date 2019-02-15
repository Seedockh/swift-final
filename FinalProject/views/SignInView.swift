import UIKit

class SignInView: UIView, SignInViewDelegate {
    @IBOutlet weak var signInView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    var delegate: SignInViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("SignInView", owner: self, options: nil)
        addSubview(signInView)
        signInView.frame = self.bounds
        signInView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        errorLabel.text = ErrorHandler.noError.getErrorMessage()
    }

    @IBAction func goToRegister() {
        errorLabel.text = ""
        delegate?.goToRegister()
    }
    
    @IBAction func login() {
        errorLabel.text = ""
        delegate?.login()
    }
    
    func checkFields() -> Bool {
        guard let checkedUser = RegisterUser.instance.user else {
            errorLabel.text = ErrorHandler.loginNotRegistered.getErrorMessage()
            return false
        }
        let emailUnwrapped: String = emailTextField.text ?? ""
        let passwordUnwrapped: String = passwordTextField.text ?? ""
    
        if (emailUnwrapped == "" || passwordUnwrapped == "" || emailUnwrapped != checkedUser.email || passwordUnwrapped != checkedUser.password ) {
            errorLabel.text = ErrorHandler.loginInvalidCredentials.getErrorMessage()
            return false
        }
        //errorLabel.text = ErrorHandler.loginSuccessful.getErrorMessage()
        return true
    }
}
