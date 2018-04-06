//
//  CustomCellCalendar.swift
//  OurLadyHope
//
//  Created by Tan Do  on 3/30/18.
//  Copyright © 2018 Tan Do . All rights reserved.
//

import UIKit

class CustomCellCalendar: UITableViewCell {

    @IBOutlet weak var calendarText: UILabel!
    @IBOutlet weak var calendarImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
