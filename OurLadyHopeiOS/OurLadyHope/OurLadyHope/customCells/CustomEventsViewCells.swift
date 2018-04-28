//
//  CustomEventsViewCells.swift
//  OurLadyHope
//
//  Created by Tan Do  on 4/28/18.
//  Copyright © 2018 Tan Do . All rights reserved.
//

import UIKit

class CustomEventsViewCells: UITableViewCell {

    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var event01: UILabel!
    @IBOutlet weak var event02: UILabel!
    @IBOutlet weak var event03: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
