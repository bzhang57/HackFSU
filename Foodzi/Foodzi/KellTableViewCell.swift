//
//  KellTableViewCell.swift
//  Foodzi
//
//  Created by Kelly Chen on 3/3/18.
//  Copyright © 2018 Bryan Zhang. All rights reserved.
//

import UIKit

class KellTableViewCell: UITableViewCell {

    @IBOutlet weak var trendingSearch: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
