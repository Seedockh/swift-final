import UIKit

class SignInView: UIView, SignInViewDelegate {
    @IBOutlet weak var signInView: UIView!
    
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
}
