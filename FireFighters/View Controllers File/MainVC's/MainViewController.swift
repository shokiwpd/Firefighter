import UIKit
import Firebase
@IBDesignable
class MainViewController: UIViewController,UICollectionViewDelegate {
    let userInfo = UserProfile.userInform
    let CustomView = UICustomClass()
    let MonthWorkClass = MonthWork()
    let TimersClass = DayFormat()
    let GuardClass = GuardFunc()
    var statusTextLabel = ""
    
    @IBOutlet weak var weatherAPI: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var welcomeMessage: UILabel!
    @IBOutlet weak var InformationCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.insertSubview(view.backgraundView(), at: 0)
        self.view.insertSubview(view.blurringScreen(), at: 1)
        title = "Главная"
        profileImage.image = userInfo.userPhoto
        welcomeMessage.text = "Здравствуйте \(String(userInfo.userName)) \(String(userInfo.userPatronymic))"

    }
    override func viewDidLayoutSubviews() {
        self.profileImage.layer.cornerRadius = self.profileImage.bounds.size.width / 2.0
        self.profileImage.clipsToBounds = true
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//        self.profileImage.layer.cornerRadius = self.profileImage.bounds.size.width / 2.0
//        self.profileImage.clipsToBounds = true
    }

}






//        for (Data, karaul) in MonthWorkClass.Month(MonthNum: todayDate()) {
//            if Data == TimersClass.todayDate(){
//                switch userInfo.userChange {
//                    case 1: statusTextLabel = GuardClass.Guard1(Guard: karaul, userGuard: userInfo.userChange)
//                    case 2: statusTextLabel = GuardClass.Guard2(Guard: karaul, userGuard: userInfo.userChange)
//                    case 3: statusTextLabel = GuardClass.Guard3(Guard: karaul, userGuard: userInfo.userChange)
//                    case 4: statusTextLabel = GuardClass.Guard4(Guard: karaul, userGuard: userInfo.userChange)
//                default:
//                    break
//                }}}
//        userNameLabel.text = "Здравствуйте \(String(userInfo.userName)) \(String(userInfo.userPatronymic)) "
//        statusLabel.text = statusTextLabel
//    func todayDate()-> String!{
//        let today = Date()
//        let Forrmated = DateFormatter()
//        Forrmated.dateFormat = "MM"
//        let formatedDate = Forrmated.string(from: today)
//        return formatedDate
//    }
