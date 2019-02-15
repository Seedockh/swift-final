import UIKit

class SignUpView: UIView, SignUpViewDelegate {  
    @IBOutlet weak var signUpView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    var delegate: SignUpViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("SignUpView", owner: self, options: nil)
        addSubview(signUpView)
        signUpView.frame = self.bounds
        signUpView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        errorLabel.text = ErrorHandler.noError.getErrorMessage()
    }
    
    @IBAction func goToLogin() {
        errorLabel.text = ""
        delegate?.goToLogin()
    }
    
    @IBAction func register() {
        errorLabel.text = ""
        delegate?.register()
    }
    
    func checkFields() -> Bool {
        let emailUnwrapped: String = emailTextField.text ?? ""
        let passwordUnwrapped: String = passwordTextField.text ?? ""
        let confirmPasswordUnwrapped: String = confirmPasswordTextField.text ?? ""
        if (emailUnwrapped == "" || passwordUnwrapped == "" || confirmPasswordUnwrapped == "" || passwordUnwrapped != confirmPasswordUnwrapped) {
            errorLabel.text = ErrorHandler.registerInvalidCredentials.getErrorMessage()
            return false
        }
        errorLabel.text = ErrorHandler.registerSuccessful.getErrorMessage()
        return true
    }
}
