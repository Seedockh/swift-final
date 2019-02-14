import UIKit

class ProfilView: UIView {
    @IBOutlet weak var profilView: UIView!
    
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

}
