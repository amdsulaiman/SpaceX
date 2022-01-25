//
//  RocketDetailImageVC.swift
//  SpaceX
//
//  

import UIKit
import SDWebImage
class RocketDetailImageVC: UIViewController {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var RocketImage: UIImageView!
    var image = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imgUrl = image
        RocketImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
        RocketImage.sd_setImage(with: URL(string: imgUrl), completed: nil)
        
    }
    

    

}
