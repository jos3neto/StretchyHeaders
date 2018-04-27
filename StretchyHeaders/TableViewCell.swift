//
//  TableViewCell.swift
//  StretchyHeaders
//
//  Created by Jose on 1/4/18.
//  Copyright © 2018 appcat.com. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var headlineLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state`
    }
    
    func setUpLabels(newsItem: NewsItem)
    {
        let (categoryString, color) = newsItem.category.toStringAndColor()
        
        categoryLabel.text = categoryString
        categoryLabel.textColor = color
        headlineLabel.text = newsItem.headline
    }

}
