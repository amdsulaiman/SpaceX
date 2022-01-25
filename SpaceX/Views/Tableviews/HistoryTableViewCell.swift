//
//  HistoryTableViewCell.swift
//  SpaceX
//
//  
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    static let identifier = "HistoryTableViewCell"
    
    
    @IBOutlet weak var baseView: RCustomView!
    @IBOutlet weak var LogoimageView: RCustomImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    static func nib() -> UINib {
        return UINib(nibName: "HistoryTableViewCell", bundle: nil)
    }
    
}
