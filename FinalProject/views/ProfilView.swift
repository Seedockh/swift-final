import UIKit

class ProfilView: UIView {
    @IBOutlet weak var profilView: UIView!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmNewPasswordTextField: UITextField!
    @IBOutlet weak var emailDisplay: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    
    var delegate: ProfilViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("ProfilView", owner: self, options: nil)
        addSubview(profilView)
        profilView.frame = self.bounds
        profilView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        errorLabel.text = ErrorHandler.noError.getErrorMessage()
    }
    
    func displayEmail() {
        emailDisplay.text = RegisterUser.instance.user?.email
    }

    func goToProfile() {
        errorLabel.text = ""
        delegate?.goToProfile()
    }
    
    @IBAction func changePassword() {
        errorLabel.text = ""
        delegate?.changePassword()
    }
    
    func checkFields() -> Bool {
        let newPwdUnwrapped: String = newPasswordTextField.text ?? ""
        let confirmNewPwdUnwrapped: String = confirmNewPasswordTextField.text ?? ""
        
        if (newPwdUnwrapped == "" || confirmNewPwdUnwrapped == "" || newPwdUnwrapped != confirmNewPwdUnwrapped) {
            errorLabel.text = ErrorHandler.changePasswordInvalidPassword.getErrorMessage()
            return false
        } else if newPwdUnwrapped.count <= 5 {
            errorLabel.text = ErrorHandler.passwordTooShort.getErrorMessage()
            return false
        }
        errorLabel.text = ""
        return true
    }
    
    @IBAction func logout() {
        delegate?.logout()
    }
}
