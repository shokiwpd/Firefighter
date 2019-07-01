//
//  documentsVC.swift
//  FireFighters
//
//  Created by Павел on 20/03/2019.
//  Copyright © 2019 Павел. All rights reserved.
//

import UIKit
import WebKit
import MBProgressHUD
class documentsVC: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webPDFview: WKWebView!
    
    var filesName = ""
    override func viewDidLayoutSubviews() {
        webPDFview.backgroundColor = .black
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView()
        webPDFview.navigationDelegate = self
        openPDFfile(filename: filesName)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
            //    webPDFview.navigationDelegate = self

    }
    @IBAction func closeViewButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    private func openPDFfile(filename: String){
        if let filePath = Bundle.main.url(forResource: filename, withExtension: "pdf") {
            let reauest = URLRequest(url: filePath)
            webPDFview.load(reauest)
        }
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        MBProgressHUD.hide(for: self.view, animated: true)
        print("end")
    }
//    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
//        print("start")
//    }
    
    func progressView(){
        let Load = MBProgressHUD.showAdded(to: self.view, animated: true)
        Load.mode = MBProgressHUDMode.indeterminate
        Load.label.text = "Загрузка..."
        Load.isUserInteractionEnabled = false
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
