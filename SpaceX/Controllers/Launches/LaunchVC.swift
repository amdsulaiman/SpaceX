//
//  LaunchVC.swift
//  SpaceX
//
//  
//

import UIKit
import SDWebImage

class LaunchVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var tblview: UITableView!
    var categoryArr = ["All Launches","Past Launch","Upcoming Launches","Next Launches"]
    var selectedIndex = Int ()
    var LaunchArray : [LaunchDataModel] = []
    var missionNameArr = [String]()
    var launchDateArr = [String]()
    var rocketNameArr = [String]()
    var launchSiteNameArr = [String]()
    var launchSuccessArr = [Bool]()
    var flightNumberArr = [Int]()
    var videoLinkArr = [String]()
    var wikiLinkArr = [String]()
    var detailsArr = [String]()
    var ImageArr = [String]()
    var launchvalue = "1"
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAPI()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupAPI()
        tblview.scroll(to: .top, animated: true)
    }
    func setupAPI() {
        callforAllLaunch()
    }
    func setupTableview() {
        tblview.register(LaunchTableViewCell.nib(), forCellReuseIdentifier: LaunchTableViewCell.identifier)
        tblview.delegate = self
        tblview.dataSource = self
        tblview.reloadData()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LaunchArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblview.dequeueReusableCell(withIdentifier: "LaunchTableViewCell") as! LaunchTableViewCell
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = .systemBackground
        cell.selectedBackgroundView = bgColorView
        let unixTimestamp = self.LaunchArray[indexPath.row].launchDateUnix.unsafelyUnwrapped
        let date = Date(timeIntervalSince1970: TimeInterval(unixTimestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let strDate = dateFormatter.string(from: date)
        let imgUrl = (LaunchArray[indexPath.row].links?.missionPatchSmall.unsafelyUnwrapped)!
        cell.launchImg.sd_imageIndicator = SDWebImageActivityIndicator.gray
        cell.launchImg.sd_setImage(with: URL(string: imgUrl), completed: nil)
            cell.titleLbl.text  = LaunchArray[indexPath.row].missionName.unsafelyUnwrapped
        cell.subTitleLbl1.text = LaunchArray[indexPath.row].rocket?.rocketName.unsafelyUnwrapped
        cell.subTitleLbl2.text = strDate
        cell.subTitleLbl3.text = LaunchArray[indexPath.row].launchSite?.siteName.unsafelyUnwrapped
        if LaunchArray[indexPath.row].launchSuccess.unsafelyUnwrapped == true {
            cell.subTitleLbl4.text = "Sucessful Launch"
        }
        else {
            cell.subTitleLbl4.text = "Failed Launch"
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tblview.frame.size.height / 3
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: "LaunchDetailVC") as! LaunchDetailVC
        vc.modalPresentationStyle = .fullScreen
        if LaunchArray[indexPath.row].details == "" {
            vc.details = "No Details  Found"
        }
        else {
            vc.details = LaunchArray[indexPath.row].details ?? "No Details  Found"
        }
        vc.videoLink = (LaunchArray[indexPath.row].links?.youtubeID.unsafelyUnwrapped)!
        vc.wikiLink = (LaunchArray[indexPath.row].links?.wikipedia.unsafelyUnwrapped)!
        vc.flightNumber = (LaunchArray[indexPath.row].flightNumber.unsafelyUnwrapped)
        vc.rocketName =  (LaunchArray[indexPath.row].rocket?.rocketName.unsafelyUnwrapped)!
        vc.launchSite = (LaunchArray[indexPath.row].launchSite?.siteName.unsafelyUnwrapped)!
        if LaunchArray[indexPath.row].launchSuccess.unsafelyUnwrapped == true {
            vc.result = "Sucessful Launch"
        }
        else {
            vc.result = "Failed Launch"
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func callforAllLaunch() {
        GlobalObj.displayLoader(true, show: true)
        APIClient.webserviceForLaunches {result  in
            self.LaunchArray = result
            print("the count is ..\(self.LaunchArray.count)")
            self.setupTableview()
            GlobalObj.displayLoader(true, show: false)
            self.tblview.reloadData()

        }
    }
    func callforPastLaunch() {
        GlobalObj.displayLoader(true, show: true)
        APIClient.webserviceForPastLaunches {result  in
            self.LaunchArray = result
            print("the count is ..\(self.LaunchArray.count)")
            self.setupTableview()
            GlobalObj.displayLoader(true, show: false)
            self.tblview.reloadData()

        }
    }
    func callforUpcomingLaunch() {
        GlobalObj.displayLoader(true, show: true)
        APIClient.webserviceForUpcomingLaunches {result  in
            self.LaunchArray = result
            print("the count is ..\(self.LaunchArray.count)")
            self.setupTableview()
            GlobalObj.displayLoader(true, show: false)
            self.tblview.reloadData()

        }
    }
    func callforNextLaunch() {
        GlobalObj.displayLoader(true, show: true)
        APIClient.webserviceForNextLaunches {result  in
            self.LaunchArray = result
            print("the count is ..\(self.LaunchArray.count)")
            self.setupTableview()
            GlobalObj.displayLoader(true, show: false)
            self.tblview.reloadData()

        }
    }
    
    

}
extension UITableView {

    public func reloadData(_ completion: @escaping ()->()) {
        UIView.animate(withDuration: 0, animations: {
            self.reloadData()
        }, completion:{ _ in
            completion()
        })
    }

    func scroll(to: scrollsTo, animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300)) {
            let numberOfSections = self.numberOfSections
            let numberOfRows = self.numberOfRows(inSection: numberOfSections-1)
            switch to{
            case .top:
                if numberOfRows > 0 {
                     let indexPath = IndexPath(row: 0, section: 0)
                     self.scrollToRow(at: indexPath, at: .top, animated: animated)
                }
                break
            case .bottom:
                if numberOfRows > 0 {
                    let indexPath = IndexPath(row: numberOfRows-1, section: (numberOfSections-1))
                    self.scrollToRow(at: indexPath, at: .bottom, animated: animated)
                }
                break
            }
        }
    }

    enum scrollsTo {
        case top,bottom
    }
}
