//
//  MissionTableViewCell.swift
//  SpaceX
//
//  
//

import UIKit

class MissionTableViewCell: UITableViewCell {

    static let identifier = "MissionTableViewCell"
    @IBOutlet weak var baseView: RCustomView!
    @IBOutlet weak var titleLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static func nib() -> UINib {
        return UINib(nibName: "MissionTableViewCell", bundle: nil)
    }
    
    
}
