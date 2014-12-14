//
//  DetailViewController.swift
//  MyFirstApp
//
//  Created by Kenichi Saito on 12/8/14.
//  Copyright (c) 2014 TechLogics. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var URLString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var url = NSURL(string: URLString)
        webView.loadRequest(NSURLRequest(URL: url!))
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
