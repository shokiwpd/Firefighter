import UIKit

class CustomProfileCell: UITableViewCell {
//    @IBOutlet weak var labelViewCell: UILabel!
//    @IBOutlet weak var commentLabel: UILabel!
    
    let labelText: UILabel = {
        let text = UILabel()
            text.numberOfLines = 0
            text.textAlignment = .center
            text.font = UIFont.systemFont(ofSize: 15, weight: .light)
            text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        labelText.topAnchor.constraint(equalTo: topAnchor).isActive = true
        labelText.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        labelText.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        labelText.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        addSubview(labelText)
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
