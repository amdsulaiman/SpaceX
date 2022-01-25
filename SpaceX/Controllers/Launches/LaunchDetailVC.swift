//
//  LaunchDetailVC.swift
//  SpaceX
//
//  
//

import UIKit
import youtube_ios_player_helper
import KRProgressHUD

class LaunchDetailVC: UIViewController, YTPlayerViewDelegate {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var videoView: YTPlayerView!
    @IBOutlet weak var scrollBaseView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var wikiRefBtn: UIButton!
    @IBOutlet weak var detailTxt: UITextView!
    @IBOutlet weak var detailtxtHC: NSLayoutConstraint!
    @IBOutlet weak var flightNumberTxt: UITextField!
    @IBOutlet weak var launchSiteTxt: UITextField!
    @IBOutlet weak var rocketNameTxt: UITextField!
    @IBOutlet weak var resultTxt: UITextField!
    
    var videoLink  = ""
    var wikiLink = ""
    var details = ""
    var flightNumber = 0
    var rocketName = ""
    var launchSite = ""
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GlobalObj.displayLoader(true, show: true)
        baseView.isHidden = true
        videoView.delegate = self
        videoView.load(withVideoId: videoLink)
        setupData()
        setupUI()
    }
    func setupData() {
        detailTxt.isEditable = false
        detailTxt.text = details
        detailtxtHC.constant = self.detailTxt.contentSize.height
        flightNumberTxt.text = String(flightNumber)
        launchSiteTxt.text = launchSite
        rocketNameTxt.text = rocketName
        resultTxt.text = result
    }
    func setupUI() {
        detailTxt.layer.cornerRadius = 8
    }
    
    @IBAction func wikiBtnAction(_ sender: RCustomButton) {
        if let url = URL(string: wikiLink) {
            UIApplication.shared.open(url)
        }
    }
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        GlobalObj.displayLoader(true, show: false)
        baseView.isHidden = false
    }
    

}
