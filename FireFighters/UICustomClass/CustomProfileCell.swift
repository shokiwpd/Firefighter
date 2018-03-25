import UIKit

class CustomProfileCell: UITableViewCell {
    let UICastom = UICustomClass()
    @IBOutlet weak var labelViewCell: UILabel!
    @IBOutlet weak var iconCell: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        UICastom.customImage(image: iconCell)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
