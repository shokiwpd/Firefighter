import UIKit
import Firebase

class MainViewController: UIViewController {
    let userInfo = UserProfile.userInform
    let CustomView = UICustomClass()
    let MonthWorkClass = MonthWork()
    let TimersClass = DayFormat()
    let GuardClass = GuardFunc()
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var scrollViews: UIScrollView!
    @IBOutlet weak var LabelView: UILabel!
    var statusTextLabel = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        for (Data, karaul) in MonthWorkClass.Month(MonthNum: todayDate()) {
            if Data == TimersClass.todayDate(){
                print(Data, karaul)
                switch userInfo.userChange {
                case 1: statusTextLabel = GuardClass.Guard1(Guard: karaul, userGuard: userInfo.userChange)
                case 2: statusTextLabel = GuardClass.Guard2(Guard: karaul, userGuard: userInfo.userChange)
                case 3: statusTextLabel = GuardClass.Guard3(Guard: karaul, userGuard: userInfo.userChange)
                case 4: statusTextLabel = GuardClass.Guard4(Guard: karaul, userGuard: userInfo.userChange)
                default:
                    break
                }}}
        userNameLabel.text = "Здравствуйте \(String(userInfo.userName)) \(String(userInfo.userPatronymic)) "
        statusLabel.text = """
        Сегодня \(String(TimersClass.todayDate()))
        \(statusTextLabel)
        """
        LabelView.text = UnitTestEnum.theFirstTest.rawValue
    }
    func todayDate()-> String!{
        let today = Date()
        let Forrmated = DateFormatter()
        Forrmated.dateFormat = "MM"
        let formatedDate = Forrmated.string(from: today)
        return formatedDate
    }
}

