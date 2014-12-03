//
//  ViewController.swift
//  NewsWithSwift
//
//  Created by Kenichi Saito on 11/5/14.
//  Copyright (c) 2014 TechLogics. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let URLStrings = ["http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://liginc.co.jp/feed&num=20",
                      "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://www.nxworld.net/feed/&num=20",
                      "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://feeds.gizmodo.jp/rss/gizmodo/index.xml&num=20"
                      ]
    let imageNames = ["lig", "nxworld", "gizmodo"]
    
    var entries = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if indexPath.row % 3 == 0 {
            cell = tableView.dequeueReusableCellWithIdentifier("top") as UITableViewCell
        } else if indexPath.row % 5 == 0 {
            cell = tableView.dequeueReusableCellWithIdentifier("top2") as UITableViewCell
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier("news") as UITableViewCell
        }
        var entry = entries[indexPath.row] as NSDictionary
        
        var titleLabel = cell.viewWithTag(1) as UILabel
        var descriptionLabel = cell.viewWithTag(2) as UILabel
        var dateLabel = cell.viewWithTag(3) as UILabel
        
        titleLabel.text = entries[indexPath.row]["title"] as? String
        descriptionLabel.text = entries[indexPath.row]["contentSnippet"] as? String
        dateLabel.text = entries[indexPath.row]["publishedDate"] as? String
        
        var urlString = entry["url"] as String
        var index = find(URLStrings, urlString)
        var imageName = self.imageNames[index!]
        var image = UIImage(named: imageName)
        var imageView = cell.viewWithTag(4) as UIImageView
        imageView.image = image

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("detail", sender: entries[indexPath.row])
    }

    @IBAction func refresh(sender: AnyObject) {

        entries.removeAllObjects()
        
        for URLString in URLStrings {
        
            var url = NSURL(string: URLString)
            var task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: {data, response, error in
                var dict = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
                
                if var responseData = dict["responseData"] as? NSDictionary {
                    if var feed = responseData["feed"] as? NSDictionary {
                        if var entries = feed["entries"] as? NSArray {
                            var formatter = NSDateFormatter()
                            formatter.locale = NSLocale(localeIdentifier: "en-US")
                            formatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss zzzz"
                            for var i = 0; i < entries.count; i++ {
                                var entry = entries[i] as NSMutableDictionary
                                entry["url"] = URLString
                                var dateStr = entry["publishedDate"] as String
                                var date = formatter.dateFromString(dateStr)
                                entry["date"] = date
                            }
                            self.entries.addObjectsFromArray(entries)
                        }
                    }
                }
            
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableView.reloadData()
                })
            })
            task.resume()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detail" {
            var detailController = segue.destinationViewController as DetailViewController
            detailController.entry = sender as NSDictionary
        }
    }
}

