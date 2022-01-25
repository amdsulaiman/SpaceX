//
//  HistoryDetailVC.swift
//  SpaceX
//
//  
//

import UIKit

class HistoryDetailVC: UIViewController {

    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var dateOPLbl: UILabel!
    @IBOutlet weak var flightNumberOPLbl: UILabel!
    @IBOutlet weak var articleView: RCustomView!
    @IBOutlet weak var detailsTxtView: RCustomTextView!
    @IBOutlet weak var textHC: NSLayoutConstraint!
    
    var date = ""
    var flightNumber = 0
    var details = ""
    var article = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textHC.constant = detailsTxtView.contentSize.height
        setupUI()
        setupArticleLink()
        textHC.constant = detailsTxtView.contentSize.height
        
    }
    func setupUI() {
        dateOPLbl.text = date
        if flightNumber == 0 {
            flightNumberOPLbl.text = "No Flight Details Found"
        }
        else {
            flightNumberOPLbl.text = String(flightNumber)
        }
        detailsTxtView.text = details
        textHC.constant = detailsTxtView.contentSize.height

    }
    func setupArticleLink(){
        articleView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ArticleLink))
        articleView.addGestureRecognizer(gesture)
    }
    @objc func ArticleLink() {
        if let url = URL(string: article) {
            UIApplication.shared.open(url)
        }
    }
    

   

}
