import UIKit

class ProfilView: UIView {
    @IBOutlet weak var profilView: UIView!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmNewPasswordTextField: UITextField!
    
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
    }

    func goToProfile() {
        delegate?.goToProfile()
    }
    
    @IBAction func changePassword() {
        delegate?.changePassword()
    }
    
    func checkFields() -> Bool {
        var checked: Bool = true
        let newPwdUnwrapped: String = newPasswordTextField.text ?? ""
        let confirmNewPwdUnwrapped: String = confirmNewPasswordTextField.text ?? ""
        
        if (newPwdUnwrapped == "" || confirmNewPwdUnwrapped == "" || newPwdUnwrapped != confirmNewPwdUnwrapped) {
            print("Passwords are not matching")
            checked = false
        }
        return checked
    }
    
    @IBAction func logout() {
        delegate?.logout()
    }
}
