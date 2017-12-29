import UIKit

class CustomProfileCell: UITableViewCell {

    @IBOutlet weak var labelViewCell: UILabel!
    @IBOutlet weak var iconCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
