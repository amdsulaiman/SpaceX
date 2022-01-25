//
//  RocketTableViewCell.swift
//  SpaceX
//
//  
//

import UIKit

class RocketTableViewCell: UITableViewCell {

    static let identifier = "RocketTableViewCell"
    @IBOutlet weak var baseView: RCustomView!
    @IBOutlet weak var rocketImg: UIImageView!
    @IBOutlet weak var titelLbl: UILabel!
    @IBOutlet weak var engineLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        rocketImg.layer.cornerRadius = 8
        engineLbl.layer.cornerRadius = 5
        engineLbl.layer.masksToBounds = true
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static func nib() -> UINib {
        return UINib(nibName: "RocketTableViewCell", bundle: nil)
    }

}
