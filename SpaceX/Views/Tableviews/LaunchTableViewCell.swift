//
//  LaunchTableViewCell.swift
//  SpaceX
//
//  
//

import UIKit

class LaunchTableViewCell: UITableViewCell {
    
    static let identifier = "LaunchTableViewCell"
    @IBOutlet weak var baseView: RCustomView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var launchImg: UIImageView!
    @IBOutlet weak var subTitleLbl1: UILabel!
    @IBOutlet weak var subTitleLbl2: UILabel!
    @IBOutlet weak var subTitleLbl3: UILabel!
    @IBOutlet weak var subTitleLbl4: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static func nib() -> UINib {
        return UINib(nibName: "LaunchTableViewCell", bundle: nil)
    }

    
}
