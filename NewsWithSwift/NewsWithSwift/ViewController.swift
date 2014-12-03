//
//  ViewController.swift
//  NewsWithSwift
//
//  Created by Kenichi Saito on 11/5/14.
//  Copyright (c) 2014 TechLogics. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let newsUrlStrings = ["http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://rss.itmedia.co.jp/rss/2.0/news_bursts.xml&num=10", "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://jp.techcrunch.com/feed/&num=10", "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://feeds.gizmodo.jp/rss/gizmodo/index.xml&num=10"]
    let imageNames = ["gizmodo", "techCrunch", "itmedia"]
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
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCellWithIdentifier("top") as UITableViewCell
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
        var index = find(newsUrlStrings, urlString)
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
        
        for newsUrlString in newsUrlStrings {
        
            var url = NSURL(string: newsUrlString)
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
                                entry["url"] = newsUrlString
                                
                                var dateStr = entry["publishedDate"] as String
                                var date = formatter.dateFromString(dateStr)
                                entry["date"] = date
                            }
                            self.entries.addObjectsFromArray(entries)
                            self.entries.sortUsingComparator({ object1, object2 in
                                var date1 = object1["date"] as NSDate
                                var date2 = object2["date"] as NSDate
                                
                                var order = date1.compare(date2)
                                
                                if order == NSComparisonResult.OrderedAscending {
                                    return NSComparisonResult.OrderedDescending
                                } else if order == NSComparisonResult.OrderedDescending {
                                    return NSComparisonResult.OrderedAscending
                                }
                                
                                return order
                            })
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

