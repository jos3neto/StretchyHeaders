//
//  NewsItem.swift
//  StretchyHeaders
//
//  Created by Jose on 3/4/18.
//  Copyright © 2018 appcat.com. All rights reserved.
//

import UIKit

let itemsArray =
[
        NewsItem(category: .world, headline:"Climate change protests, divestments meet fossil fuels realities"),
        NewsItem(category: .americas, headline:"Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"),
        NewsItem(category: .europe, headline:"'One million babies' created by EU student exchanges"),
        NewsItem(category: .middleEast, headline:"Airstrikes boost Islamic State, FBI director warns more hostages possible"),
        NewsItem(category: .africa, headline:"Nigeria says 70 dead in building collapse; questions South Africa victim claim"),
        NewsItem(category: .asiaPacific, headline:"Despite UN ruling, Japan seeks backing for whale hunting")
]


struct NewsItem
{
    var category: Category
    var headline: String
}


enum Category
{
    case world
    case americas
    case europe
    case middleEast
    case africa
    case asiaPacific
    
    func toStringAndColor() -> (String, UIColor)
    {
        switch self
        {
        case .world:
            return ("World",#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1))
        case .americas:
            return ("Americas",#colorLiteral(red: 0.5563425422, green: 0.9793455005, blue: 0, alpha: 1))
        case .europe:
            return ("Europe",#colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1))
        case .middleEast:
            return ("Middle East",#colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1))
            
        case .africa:
            return ("Africa",#colorLiteral(red: 1, green: 0.5212053061, blue: 1, alpha: 1))
            
        case .asiaPacific:
            return ("Asia Pacific",#colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1))
        }
    }
}
