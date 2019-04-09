//
//  documentsVC.swift
//  FireFighters
//
//  Created by Павел on 20/03/2019.
//  Copyright © 2019 Павел. All rights reserved.
//

import UIKit

class documentsVC: UIViewController {

    @IBOutlet weak var documentsText: UILabel!
    var textDocumentation: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.darkThemeView()
        documentsText.darkThemeLabel()
        documentsText.text = textDocumentation
    }
    @IBAction func closeViewButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
