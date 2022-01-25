//
//  ImageCollectionViewCell.swift
//  SpaceX
//
//  
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var baseView: RCustomView!
    @IBOutlet weak var imageView: RCustomImageView!
    static let identifier = "ImageCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static func nib() -> UINib {
        return UINib(nibName: "ImageCollectionViewCell", bundle: nil)
    }


}
