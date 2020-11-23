import UIKit

class DocViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DocSelCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        cell.textLabel!.text = DocSelCell[indexPath.row]
        cell.backgroundColor = .clear
        return cell
    }
    
    let DocSelCell = ["Газодымозащитная служба","Приказы МЧС, Постановления","ПТВ и АСИ","Нормативы", "Пожарная техника"]
    
    let documentsTableView: UITableView = {
       let doc = UITableView()
        doc.translatesAutoresizingMaskIntoConstraints = false
        doc.backgroundColor = .clear
        return doc
    }()
    
    
    
    override func viewDidLayoutSubviews() {
        self.view.viewThemeColor()
        documentsTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        documentsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        documentsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        documentsTableView.bottomAnchor.constraint(equalTo: tabBarController!.tabBar.topAnchor).isActive = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        documentsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        documentsTableView.delegate = self
        documentsTableView.dataSource = self
        view.addSubview(documentsTableView)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        NotificationCenter.default.addObserver(self, selector: #selector(DarkNotification), name: NSNotification.Name.init(rawValue: "DarkTheme"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        @objc func DarkNotification(notif: Notification) {
            guard let userInfo  = notif.userInfo, let Dark = userInfo["Type"] as? String else { return }
            if Dark != "" {
                let mainViewReload = DispatchQueue.main
                    mainViewReload.async {
                    self.view.viewThemeColor()
                }
            }
        }
}


