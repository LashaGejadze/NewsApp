//
//  NewsTableCell.swift
//  NewsApp
//
//  Created by macosx on 09.07.17.
//  Copyright © 2017 macosx. All rights reserved.
//

import UIKit

class NewsTableCell: UITableViewCell {
    @IBOutlet weak var tableImage: UIImageView!
    @IBOutlet weak var tableLabel: UILabel!
    @IBOutlet weak var tableText: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
