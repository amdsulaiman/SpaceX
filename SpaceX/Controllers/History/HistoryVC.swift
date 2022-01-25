//
//  HistoryVC.swift
//  SpaceX
//
//  
//

import UIKit
import EFCountingLabel

class HistoryVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var rocketCountLbl: EFCountingLabel!
    @IBOutlet weak var totalLandingsLbl: EFCountingLabel!
    @IBOutlet weak var reflownrocketsLbl: EFCountingLabel!
    @IBOutlet weak var historyTblview: UITableView!
    @IBOutlet weak var mainView: UIView!
    var HistoryArray : [HistoryDataModel] = []
    var HistoryImageArray = [UIImage(named: "id1"),UIImage(named: "id2"),UIImage(named: "id1"),UIImage(named: "id4"),UIImage(named: "id5"),UIImage(named: "id6"),UIImage(named: "id7"),UIImage(named: "id8"),UIImage(named: "id9"),UIImage(named: "id10"),UIImage(named: "id11"),UIImage(named: "id12"),UIImage(named: "id13"),UIImage(named: "id14"),UIImage(named: "id15"),UIImage(named: "id16"),UIImage(named: "id17"),UIImage(named: "id18"),UIImage(named: "id19"),UIImage(named: "id20")]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCount()
        setupUI()
        callforHistoryAPI()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupCount()
        setupUI()
        callforHistoryAPI()
        historyTblview.scroll(to: .top, animated: true)
    }
    func setupCount() {
        rocketCountLbl.countFrom(0, to: 127, withDuration: 1.0)
        totalLandingsLbl.countFrom(0, to: 89, withDuration: 1.0)
        reflownrocketsLbl.countFrom(0, to: 68, withDuration: 1.0)
    }
    func setupUI(){
        mainView.layer.cornerRadius = 24
    }
    func setupTableview(){
        historyTblview.register(HistoryTableViewCell.nib(), forCellReuseIdentifier: HistoryTableViewCell.identifier)
        historyTblview.delegate = self
        historyTblview.dataSource = self
        historyTblview.reloadData()
    }
    func callforHistoryAPI() {
        GlobalObj.displayLoader(true, show: true)
        APIClient.webserviceForHistory {result  in
            self.HistoryArray = result
            print("the count is ..\(self.HistoryArray.count)")
            self.setupTableview()
            GlobalObj.displayLoader(true, show: false)
            self.historyTblview.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = historyTblview.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as! HistoryTableViewCell
        let bgColorView = UIView()
        bgColorView.backgroundColor = .systemBackground
        cell.selectedBackgroundView = bgColorView
        cell.LogoimageView.image = HistoryImageArray[indexPath.row]
        cell.titleLbl.text = self.HistoryArray[indexPath.row].title.unsafelyUnwrapped
        cell.backgroundColor = .white
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: "HistoryDetailVC") as! HistoryDetailVC
        vc.modalPresentationStyle = .fullScreen
        let unixTimestamp = self.HistoryArray[indexPath.row].event_date_unix.unsafelyUnwrapped
        let date = Date(timeIntervalSince1970: TimeInterval(unixTimestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let strDate = dateFormatter.string(from: date)
        vc.date = strDate
        if  self.HistoryArray[indexPath.row].flight_number == nil {
            vc.flightNumber = 0
        }
        else {
            vc.flightNumber = self.HistoryArray[indexPath.row].flight_number!
        }
        vc.details = self.HistoryArray[indexPath.row].details.unsafelyUnwrapped
        vc.article = (self.HistoryArray[indexPath.row].links!.article.unsafelyUnwrapped)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

