//
//  OnboardCollectionViewCell.swift
//  SpaceX
//
//  
//

import UIKit

class OnboardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var sliderImage: UIImageView!
    @IBOutlet weak var sliderTitleLbl: UILabel!
    @IBOutlet weak var sliderDescriptionLbl: UILabel!
    
    func setup(_ slide : OnboardingSlide) {
        sliderImage.image = slide.image
        sliderTitleLbl.text = slide.title
        sliderDescriptionLbl.text = slide.description
    }
    
}
