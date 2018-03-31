//
//  CalendarVC.swift
//  OurLadyHope
//
//  Created by Tan Do  on 3/30/18.
//  Copyright © 2018 Tan Do . All rights reserved.
//

import UIKit
import SDWebImage
class CalendarVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var urlsArray:NSArray!
    var monthsArray = ["Important Days", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    override func viewDidLoad() {
        super.viewDidLoad()
        urlsArray = NSArray(objects:
            "https://raw.githubusercontent.com/tando89/myImagesLinks/master/frontcalendar.png", "https://raw.githubusercontent.com/tando89/myImagesLinks/master/jan.png", "https://raw.githubusercontent.com/tando89/myImagesLinks/master/feb.png", "https://raw.githubusercontent.com/tando89/myImagesLinks/master/march.png", "https://raw.githubusercontent.com/tando89/myImagesLinks/master/april.png", "https://raw.githubusercontent.com/tando89/myImagesLinks/master/may.png", "https://raw.githubusercontent.com/tando89/myImagesLinks/master/june.png", "https://raw.githubusercontent.com/tando89/myImagesLinks/master/july.png", "https://raw.githubusercontent.com/tando89/myImagesLinks/master/august.png", "https://raw.githubusercontent.com/tando89/myImagesLinks/master/sep.png", "https://raw.githubusercontent.com/tando89/myImagesLinks/master/oct.png", "https://raw.githubusercontent.com/tando89/myImagesLinks/master/nov.png", "https://raw.githubusercontent.com/tando89/myImagesLinks/master/dec.png"
        )
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urlsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "calendarCells") as! CustomCellCalendar
        cell.calendarText?.text = monthsArray[indexPath.row]
        cell.calendarImg.sd_setImage(with: (NSURL(string: urlsArray.object(at: indexPath.row) as! String)! as URL), placeholderImage: UIImage(named: "loadingImage.png"))
        return cell
    }

}
