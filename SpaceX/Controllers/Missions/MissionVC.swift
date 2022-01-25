//
//  MissionVC.swift
//  SpaceX
//
// 
//

import UIKit

class MissionVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var missionTableview: UITableView!
    
    var missionArray : [MissionModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        callforMissionAPI()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        callforMissionAPI()
        missionTableview.scroll(to: .top, animated: true)
    }
    func setupTableview(){
        missionTableview.register(MissionTableViewCell.nib(), forCellReuseIdentifier: MissionTableViewCell.identifier)
        missionTableview.delegate = self
        missionTableview.dataSource = self
        missionTableview.reloadData()
    }
    func callforMissionAPI(){
        GlobalObj.displayLoader(true, show: true)
        APIClient.webserviceForMissions {result  in
            self.missionArray = result
            print("the count is ..\(self.missionArray.count)")
            self.setupTableview()
            GlobalObj.displayLoader(true, show: false)
            self.missionTableview.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = missionTableview.dequeueReusableCell(withIdentifier: MissionTableViewCell.identifier, for: indexPath) as! MissionTableViewCell
        let bgColorView = UIView()
        bgColorView.backgroundColor = .systemBackground
        cell.selectedBackgroundView = bgColorView
        cell.titleLbl.text = missionArray[indexPath.row].mission_name.unsafelyUnwrapped
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: "MissionDetailVC") as! MissionDetailVC
        vc.modalPresentationStyle = .fullScreen
        vc.missionName = self.missionArray[indexPath.row].mission_name.unsafelyUnwrapped
        vc.missionID = self.missionArray[indexPath.row].mission_id.unsafelyUnwrapped
        vc.details = self.missionArray[indexPath.row].description.unsafelyUnwrapped
        vc.manufacturers = self.missionArray[indexPath.row].manufacturers.unsafelyUnwrapped
        vc.articleLink = self.missionArray[indexPath.row].wikipedia.unsafelyUnwrapped
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    

}
//MissionDetailVC
//webserviceForMissions
