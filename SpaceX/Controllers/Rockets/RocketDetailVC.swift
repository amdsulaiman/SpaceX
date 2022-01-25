//
//  RocketDetailVC.swift
//  SpaceX
//
//  
//

import UIKit
import  SDWebImage
class RocketDetailVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var descriptiontxtView: UITextView!
    @IBOutlet weak var heightView: RCustomView!
    @IBOutlet weak var heightOpLbl: UILabel!
    @IBOutlet weak var diameterOpLbl: UILabel!
    @IBOutlet weak var massOpLbl: UILabel!
    @IBOutlet weak var countryView: UIView!
    @IBOutlet weak var countrtFlagImg: UIImageView!
    @IBOutlet weak var countryNameLbl: UILabel!
    @IBOutlet weak var stage1OpLbl1: UILabel!
    @IBOutlet weak var stage1OpLbl2: UILabel!
    @IBOutlet weak var stage1OpLbl3: UILabel!
    @IBOutlet weak var stage1OpLbl4: UILabel!
    @IBOutlet weak var stage2OpLbl1: UILabel!
    @IBOutlet weak var stage2OpLbl2: UILabel!
    @IBOutlet weak var stage2OpLbl3: UILabel!
    @IBOutlet weak var stage2OpLb4: UILabel!
    @IBOutlet weak var launchCostLbl: RCustomLabel!
    @IBOutlet weak var imageCollectionview: UICollectionView!
    @IBOutlet weak var decriptionHC: NSLayoutConstraint!
    var ImageArr = [String]()
    var details = ""
    var height = ""
    var diameter = ""
    var mass = ""
    var country = ""
    var stageEngine1 = ""
    var fuelAmount1 = ""
    var burnTime1 = 0
    var stageisReusable1 = ""
    var stageEngine2 = ""
    var fuelAmount2 = ""
    var burnTime2 = 0
    var stageisReusable2 = ""
    var costPerlaunch = ""
    var wikiLink = ""
    var flagImg = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decriptionHC.constant = descriptiontxtView.contentSize.height
        setupData()
        setupcollectionView()
        decriptionHC.constant = descriptiontxtView.contentSize.height
        setupUI()
    }
    func setupUI() {
        descriptiontxtView.layer.cornerRadius = 8
        launchCostLbl.layer.cornerRadius = 6
        launchCostLbl.clipsToBounds = true
    }
    func setupData() {
        descriptiontxtView.text = details
        decriptionHC.constant = descriptiontxtView.contentSize.height
        heightOpLbl.text = "\(height)" + " m"
        diameterOpLbl.text = "\(diameter)" + " m"
        massOpLbl.text = "\(mass)" + " kg"
        countryNameLbl.text = country
        stage1OpLbl1.text = stageEngine1
        stage1OpLbl2.text  = "\(fuelAmount1)" + " tons"
        stage1OpLbl4.text  = stageisReusable1
        stage2OpLbl1.text = stageEngine2
        stage2OpLbl2.text  = "\(fuelAmount2)" + " tons"
        stage2OpLb4.text  = stageisReusable2
        launchCostLbl.text = "$" + "   \(costPerlaunch)"
        countrtFlagImg.image = UIImage(named: flagImg)
        if burnTime1 == 90 {
            stage1OpLbl3.text  = "No Data found"
        }
        else {
            stage1OpLbl3.text  = "\(burnTime1)" + " seconds"
        }
        if burnTime2 == 90 {
            stage2OpLbl3.text  = "No Data found"
        }
        else {
            stage2OpLbl3.text  = "\(burnTime2)" + " seconds"
        }
    }
    func setupcollectionView() {
        imageCollectionview.register(ImageCollectionViewCell.nib(), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        imageCollectionview.delegate = self
        imageCollectionview.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        imageCollectionview.collectionViewLayout = layout
        imageCollectionview.backgroundColor = .white
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imageCollectionview.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as! ImageCollectionViewCell
        let imgUrl = (ImageArr[indexPath.row])
        cell.imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        cell.imageView.sd_setImage(with: URL(string: imgUrl), completed: nil)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: imageCollectionview.frame.size.width, height: 240)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //RocketDetailImageVC
        let vc = self.storyboard?.instantiateViewController(identifier: "RocketDetailImageVC") as! RocketDetailImageVC
        vc.modalPresentationStyle = .fullScreen
        vc.image = ImageArr[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
