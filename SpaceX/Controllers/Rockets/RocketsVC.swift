//
//  RocketsVC.swift
//  SpaceX
//
//  
//

import UIKit
import SDWebImage
class RocketsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var RocketArray : [SpaceXRocket] = []
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var rocketTblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        callforRockets()
        rocketTblView.scroll(to: .top, animated: true)
    }
    func setupTableview() {
        rocketTblView.register(RocketTableViewCell.nib(), forCellReuseIdentifier: RocketTableViewCell.identifier)
        rocketTblView.delegate = self
        rocketTblView.dataSource = self
        rocketTblView.reloadData()
    }
    func callforRockets() {
        GlobalObj.displayLoader(true, show: true)
        APIClient.webserviceForRockets {result  in
            self.RocketArray = result
            print("the count is ..\(self.RocketArray.count)")
            self.setupTableview()
            GlobalObj.displayLoader(true, show: false)
            self.rocketTblView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RocketArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = rocketTblView.dequeueReusableCell(withIdentifier:RocketTableViewCell.identifier, for: indexPath) as! RocketTableViewCell
        let bgColorView = UIView()
        bgColorView.backgroundColor = .systemBackground
        cell.selectedBackgroundView = bgColorView
        let imgUrl = (self.RocketArray[indexPath.row].flickrImages[0])!
        cell.rocketImg.sd_imageIndicator = SDWebImageActivityIndicator.gray
        cell.rocketImg.sd_setImage(with: URL(string: imgUrl), completed: nil)
        cell.titelLbl.text = self.RocketArray[indexPath.row].rocket_name.unsafelyUnwrapped
        let  engine = "\(String(describing: self.RocketArray[indexPath.row].engines!.number.unsafelyUnwrapped))" + " engines"
        cell.engineLbl.text = engine
        cell.dateLbl.text = self.RocketArray[indexPath.row].firstFlight.unsafelyUnwrapped
        cell.descriptionLbl.text = self.RocketArray[indexPath.row].description.unsafelyUnwrapped
      return cell
        
    
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.rocketTblView.frame.size.height / 3.5
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: "RocketDetailVC") as! RocketDetailVC
        vc.modalPresentationStyle = .fullScreen
        vc.ImageArr = self.RocketArray[indexPath.row].flickrImages as! [String]
        vc.details = self.RocketArray[indexPath.row].description.unsafelyUnwrapped
        vc.height = "\(self.RocketArray[indexPath.row].height!.meters.unsafelyUnwrapped)"
        vc.diameter =  "\(self.RocketArray[indexPath.row].diameter!.meters.unsafelyUnwrapped)"
        vc.mass = "\(self.RocketArray[indexPath.row].mass!.kg.unsafelyUnwrapped)"
        vc.country = self.RocketArray[indexPath.row].country.unsafelyUnwrapped
        vc.stageEngine1 = "\(self.RocketArray[indexPath.row].firstStage!.engines.unsafelyUnwrapped)"
        vc.fuelAmount1 = "\(self.RocketArray[indexPath.row].firstStage!.fuelAmountTons.unsafelyUnwrapped)"
        if "\(self.RocketArray[indexPath.row].firstStage!.burnTimeSec)" == "" {
            vc.burnTime1 = 90
        }
        else {
vc.burnTime1 = self.RocketArray[indexPath.row].firstStage!.burnTimeSec ?? 90
        }
        if "\(self.RocketArray[indexPath.row].secondStage!.burnTimeSec)" == "" {
            vc.burnTime2 = 90
        }
        else {
vc.burnTime2 = self.RocketArray[indexPath.row].secondStage!.burnTimeSec ?? 90
        if self.RocketArray[indexPath.row].firstStage?.reusable == true {
            vc.stageisReusable1 = "Yes"
        }
        else {
            vc.stageisReusable1 = "No"
        }
        vc.stageEngine2 = "\(self.RocketArray[indexPath.row].secondStage!.engines.unsafelyUnwrapped)"
        vc.fuelAmount2 = "\(self.RocketArray[indexPath.row].secondStage!.fuelAmountTons.unsafelyUnwrapped)"
        if self.RocketArray[indexPath.row].secondStage?.reusable == true {
            vc.stageisReusable2 = "Yes"
        }
        else {
            vc.stageisReusable2 = "No"
        }
        vc.costPerlaunch = String(describing: self.RocketArray[indexPath.row].costPerLaunch.unsafelyUnwrapped)
        vc.wikiLink = String(describing: self.RocketArray[indexPath.row].wikipedia.unsafelyUnwrapped)
        let flagArr = ["flag1","flag2","flag2","flag2"]
        vc.flagImg = flagArr[indexPath.row]
       self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
//String(describing: self.RocketArray[indexPath.row].height?.meters.unsafelyUnwrapped)

}
