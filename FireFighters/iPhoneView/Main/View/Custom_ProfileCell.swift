import UIKit

class CustomProfileCell: UITableViewCell {
    @IBOutlet weak var labelViewCell: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        labelViewCell.darkThemeLabel()
        commentLabel.darkThemeLabel()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
