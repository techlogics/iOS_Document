//
//  NewsTableViewController.swift
//  MyFirstApp
//
//  Created by Kenichi Saito on 12/7/14.
//  Copyright (c) 2014 TechLogics. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    // APIリクエスト用URL
    let URLString = NSURL(string:"https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://liginc.co.jp/feed&num=20")
    
    // 記事用の配列
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
        // entriesの数だけ表示
        return self.entries.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NewsCell", forIndexPath: indexPath) as UITableViewCell
        
        // エントリーのそれぞれの値を取得
        var entryTitle = self.entries[indexPath.row]["title"] as String
        var entryContent = self.entries[indexPath.row]["contentSnippet"] as String
        
        // UIパーツをタグ付け
        var eyeCatchImage = cell.viewWithTag(1) as UIImageView
        var titleLabel = cell.viewWithTag(2) as UILabel
        var contentsLabel = cell.viewWithTag(3) as UILabel
        
        // UIパーツに値を表示
        eyeCatchImage.image = UIImage(named: "lig")
        titleLabel.text = entryTitle
        contentsLabel.text = entryContent
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("DetailSegue", sender: entries[indexPath.row]["link"] as String)
    }
    
    @IBAction func refresh(sender: AnyObject) {
        
        // 記事用の配列の中身を削除
        self.entries.removeAllObjects()
        
        // ダウンロードの準備
        var downloadDataTask = NSURLSession.sharedSession().dataTaskWithURL(self.URLString!, completionHandler: {data, response, error in
            
            // 返ってきたデータをNSDictionaryにキャスト
            var dictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
            
            // 返ってきたJSONのentriesを上のentriesプロバティに代入
            if var responseData = dictionary["responseData"] as? NSDictionary {
                if var feed = responseData["feed"] as? NSDictionary {
                    if var entries = feed["entries"] as? NSArray {
                        // entries配列をentriesプロパティに追加
                        self.entries.addObjectsFromArray(entries)
                        println(entries)
                    }
                }
            }
            
            // メインスレッドでテーブルビューを更新
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
            })
            
        })
        
        // ダウンロードを開始
        downloadDataTask.resume()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DetailSegue" {
            var detailViewContorller = segue.destinationViewController as DetailViewController
            detailViewContorller.URLString = sender as String
        }
    }
}
