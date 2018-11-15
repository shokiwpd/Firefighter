import UIKit

class CustomProfileCell: UITableViewCell {
    @IBOutlet weak var labelViewCell: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    let DarkTheme = ThemeUser()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if DarkTheme.DarkTheme(userSelect: "Диначмиеская") == "Dark"{
            labelViewCell.textColor = .white
            commentLabel.textColor = .white
        } else if DarkTheme.DarkTheme(userSelect: "Диначмиеская") == "White"{
            labelViewCell.textColor = .black
            labelViewCell.textColor = .black
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
