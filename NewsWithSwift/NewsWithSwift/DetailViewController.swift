//
//  DetailViewController.swift
//  NewsWithSwift
//
//  Created by Kenichi Saito on 11/5/14.
//  Copyright (c) 2014 TechLogics. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    var entry = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var url = NSURL(string: self.entry["link"] as String)
        var request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    
    @IBAction func twitter(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            var controller = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            
            var link = entry["link"] as String
            var url = NSURL(string: link)
            controller.addURL(url)
            
            var title = entry["title"] as String
            controller.setInitialText(title)
            
            presentViewController(controller, animated: true, completion: {})
        }
    }
    
    @IBAction func facebook(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
            var controller = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            
            var link = entry["link"] as String
            var url = NSURL(string: link)
            controller.addURL(url)
            
            var title = entry["title"] as String
            controller.setInitialText(title)
            
            presentViewController(controller, animated: true, completion: {})
        }
    }
}