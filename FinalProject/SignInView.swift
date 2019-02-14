import UIKit

class SignInView: UIView, SignInViewDelegate {
    @IBOutlet weak var signInView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
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
    }

    @IBAction func goToRegister() {
        delegate?.goToRegister()
    }
    
    @IBAction func login() {
        delegate?.login()
    }
    
    func checkFields() -> Bool {
        var checked: Bool = true
        
        guard let checkedUser = RegisterUser.instance.user else {
            print("Please register first")
            return false
        }
        let emailUnwrapped: String = emailTextField.text ?? ""
        let passwordUnwrapped: String = passwordTextField.text ?? ""
    
        if (emailUnwrapped == "" || passwordUnwrapped == "" || emailUnwrapped != checkedUser.email || passwordUnwrapped != checkedUser.password) {
            print("Unable to find a match with this pair of email/password !")
            checked = false
        }
        return checked
    }
}
