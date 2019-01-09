//
//  HZSampleWebViewViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/19.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

class HZSampleWebViewViewController: UIViewController,UIWebViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let webView = UIWebView(frame: self.view.frame)
        webView.loadRequest(URLRequest(url: URL(fileURLWithPath: "https://www.apple.com")))
        webView.delegate = self
        self.view.addSubview(webView)
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

}
