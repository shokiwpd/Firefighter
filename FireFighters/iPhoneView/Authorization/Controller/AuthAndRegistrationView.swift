//
//  AuthAndRegistrationView.swift
//  FireFighters
//
//  Created by Павел on 17.03.18.
//  Copyright © 2018 Павел. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class AuthAndRegistrationView: UIViewController {
    //MARK: Оутлеты и их настройки
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.text = "Огнеборцы" // Название приложения
        }
    }
    @IBOutlet weak var authorizationButton: UIButton! // Кнопка авторизации
    @IBOutlet weak var registrationButton: UIButton! //Кнопка регистрации
    //MARK: Гардиент
    var buttonGardients = CAGradientLayer()//Гардиент
    //MARK: Лайауты,фон
    override func viewDidLayoutSubviews() {
        //MARK: Настройка внешнего вида кнопок
        authorizationButton.grayButton(nameBut: "Войти")
        registrationButton.clearButton(nameBut: "Регистрация")
        nameLabel.UIfontLabel(viewHeight: Double(view.bounds.height))
        //MARK: гардиент для кнопок
        buttonGardients.gardientButton(w: authorizationButton.frame.size.width, h: authorizationButton.frame.size.height)
        backgroundVideo(playAndStop: true)
        authorizationButton.layer.insertSublayer(buttonGardients, at: 0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //Кнопка на случай если возникли ошибки
    @IBAction func VKgroupURL(_ sender: Any) {
        let URL_VK = URL(string: "https://vk.com/firefighterapp")
        UIApplication.shared.open(URL_VK!)
    }
    //Видео фон
    private func backgroundVideo(playAndStop: Bool) {
        let videoURL = URL(fileURLWithPath: Bundle.main.path(forResource: "backgraundVideo", ofType: "mov")!)
        let playVideo = AVPlayer(url: videoURL)
        let newLayerVideo = AVPlayerLayer(player: playVideo)
        newLayerVideo.frame = self.view.frame
        self.view.layer.insertSublayer(newLayerVideo, at: 0)
        newLayerVideo.videoGravity = .resizeAspectFill
        playVideo.play()
        switch playAndStop {
        case true: playVideo.play()
        case false: playVideo.pause()
        }
        playVideo.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        NotificationCenter.default.addObserver(self, selector: #selector(AuthAndRegistrationView.loopVideo), name: Notification.Name(rawValue: "AVPlayerItemDidPlayToEndTimeNotification"), object: playVideo.currentItem)
    }
    
    //MARK: Переход на другой сториборд
    @IBAction func registrationButton(_ sender: Any) {
        let Vc = UIStoryboard(name: "firstStoryBoards", bundle: nil).instantiateInitialViewController() as! UINavigationController
        //backgroundVideo(playAndStop: false)
        present(Vc, animated: true, completion: nil)
    }

    //Повтор видео-фона
    @objc func loopVideo(_ notif: Notification) {
        let player: AVPlayerItem = notif.object as! AVPlayerItem
        player.seek(to: CMTime.zero, completionHandler: nil)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
         backgroundVideo(playAndStop: false)
    }
}
