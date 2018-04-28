//
//  EventsVC.swift
//  OurLadyHope
//
//  Created by Tan Do  on 4/28/18.
//  Copyright © 2018 Tan Do . All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON

class EventsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var eventsTableView: UITableView!
    let requestURL = "https://preachiest-calculat.000webhostapp.com/PerishEvents.php"
    var events: [[String: Any]] = [[String: Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        eventsRequest()
        // Do any additional setup after loading the view.
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
    }
    
    func eventsRequest() {
        SVProgressHUD.show(withStatus: "Getting events...")
        Alamofire.request(requestURL).responseJSON { (response) in
            if response.result.isSuccess {
                if let responseData = response.result.value as! [String : Any]? {
                    if let responseEvents = responseData["Event"] as! [[String: Any]]? {
                        self.events = responseEvents
                        self.eventsTableView?.reloadData()
                        SVProgressHUD.dismiss()
                    }
                }
            }
            else {
                print("Error \(String(describing: response.result.error))")
                self.tittleLabel?.text = "Network Error!"
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCells") as! CustomEventsViewCells
        if self.events.count > 0 {
            let eachEvent = events[indexPath.row]
            cell.eventDate?.text = (eachEvent["Date"] as? String) ?? "No Event"
            cell.event01?.text = (eachEvent["Event01"] as? String) ?? "No Event"
            cell.event02?.text = (eachEvent["Event02"] as? String) ?? "No Event"
            cell.event03?.text = (eachEvent["Event03"] as? String) ?? "No Event"
        }
        return cell
    }

}
