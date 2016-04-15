//
//  ViewController.swift
//  FacebookWebbrowserDebugApp
//
//  Created by Will Laurance on 4/8/16.
//  Copyright © 2016 Will Laurance. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var myWebView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myWebView.scalesPageToFit = true
        myWebView.contentMode = UIViewContentMode.ScaleAspectFit
        myWebView.delegate = self
        loadURLWithString("http://www.google.com")

    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        let zoom = webView.bounds.size.width / webView.scrollView.contentSize.width
        webView.scrollView.setZoomScale(zoom, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func loadURLWithString(URLString: String) {
        if let URL = NSURL(string: URLString) {
            if (URL.scheme != "") && (URL.host != nil) {
                loadURL(URL)
            } else {
                loadURLWithString("http://\(URLString)")
            }
        }
    }
    
    func loadURL(URL: NSURL, cachePolicy: NSURLRequestCachePolicy = .UseProtocolCachePolicy, timeoutInterval: NSTimeInterval = 0) {
        myWebView.loadRequest(NSURLRequest(URL: URL, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval))
    }
    
    @IBAction func back(sender: AnyObject) {
        
    }
    
    @IBAction func forward(sender: AnyObject) {
        
    }


}

