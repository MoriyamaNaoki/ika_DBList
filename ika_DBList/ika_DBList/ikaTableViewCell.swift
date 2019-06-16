import UIKit

class ikaTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var resultLanel: UILabel!
    
    @IBOutlet weak var ruleLabel: UILabel!
    
    @IBOutlet weak var stageLabel: UILabel!
    
    @IBOutlet weak var weaponLabel: UILabel!
    
    @IBOutlet weak var killLabel: UILabel!
    
    @IBOutlet weak var dethLabel: UILabel!
    
    @IBOutlet weak var specialLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
