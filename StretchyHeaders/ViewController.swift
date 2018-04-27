//
//  ViewController.swift
//  StretchyHeaders
//
//  Created by Jose on 31/3/18.
//  Copyright © 2018 appcat.com. All rights reserved.
//

import UIKit

class ViewController: UITableViewController
{
    // MARK: Properties
    
    override var prefersStatusBarHidden: Bool { return true }
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var customHeader: UIView!
    
    let kHeaderHeight: CGFloat = 213.0
    
    
    // MARK: Methods Begin
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        
        dateLabel.text = getCurrentDate()
        
        replaceDefaultHeader()
        addTopInset()
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return itemsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell
            else
        {
            fatalError("Dequeued cell is not an instance of TableViewCell.")
        }
        
        cell.setUpLabels(newsItem: itemsArray[indexPath.row])
        
        return cell
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        updateHeaderView()
    }
    
    // MARK: - Accessory Methods
    
    func getCurrentDate() -> String
    {
        let date = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MMMM dd"
        
        return dateFormatter.string(from: date)
    }
    
    func replaceDefaultHeader()
    {
        customHeader = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(customHeader)
    }
    
    func addTopInset()
    {
        //scrollable area = content (cells) + insets (padding)
        tableView.contentInset = UIEdgeInsets(top: kHeaderHeight, left: 0, bottom: 0, right: 0)
        
        //contentOffset: programatically scrolling to the very top of the scrollable area
        //same as setting the bounds of the scrollView
        tableView.contentOffset = CGPoint(x:0, y: -kHeaderHeight)
    }
    
    func updateHeaderView()
    {
        var headerRect = CGRect(x:0, y: -kHeaderHeight, width: tableView.bounds.width, height: kHeaderHeight)
        
        //it's possible to scroll beyond the scrollable area, but it's only whitespace
        //and the header will swallow the cells
        if tableView.contentOffset.y < -kHeaderHeight
        {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        
        customHeader.frame = headerRect
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

