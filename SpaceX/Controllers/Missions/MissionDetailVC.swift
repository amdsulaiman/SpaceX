//
//  MissionDetailVC.swift
//  SpaceX
//
//  
//

import UIKit

class MissionDetailVC: UIViewController {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var articleView: RCustomView!
    @IBOutlet weak var maufacturersLbl: UILabel!
    @IBOutlet weak var missionLbl: UILabel!
    @IBOutlet weak var missionNameLbl: UILabel!
    @IBOutlet weak var descriptionTxtView: UITextView!
    @IBOutlet weak var textHC: NSLayoutConstraint!
    
    var missionName = ""
    var missionID = ""
    var articleLink = ""
    var manufacturers = [String]()
    var details = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textHC.constant = descriptionTxtView.contentSize.height
        setupData()
        setupArticleLink()

    }
    func setupData(){
        missionNameLbl.text = missionName
        missionLbl.text = missionID
        for data in manufacturers {
            maufacturersLbl.text = data
        }
        descriptionTxtView.text = details
        textHC.constant = descriptionTxtView.contentSize.height
        descriptionTxtView.layer.cornerRadius = 8
        
    }
    func setupArticleLink(){
        articleView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ArticleLink))
        articleView.addGestureRecognizer(gesture)
    }
    @objc func ArticleLink() {
        if let url = URL(string: articleLink) {
            UIApplication.shared.open(url)
        }
    }

  
}
