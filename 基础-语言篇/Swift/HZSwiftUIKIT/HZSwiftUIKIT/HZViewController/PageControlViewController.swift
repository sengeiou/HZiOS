//
//  PageControlViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/11.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

class PageControlViewController: UIViewController ,UIScrollViewDelegate{
    let scrollView = UIScrollView()
    let pageControl = UIPageControl()
    var isPageControlUsed = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    func setUpView() -> Void {
        var screenFrame = UIScreen.main.bounds
        // 设置Scrollview
        scrollView.frame = screenFrame
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: self.view.width * 2, height: self.view.height)
        scrollView.backgroundColor = UIColor.gray
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        // pageControl
        pageControl.frame = CGRect(x: 0, y: self.view.height - 20 * 2, width: self.view.width, height: 20*2)
        pageControl.tintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.orange
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
        pageControl.backgroundColor = UIColor.lightGray
        pageControl.addTarget(self, action:#selector(pageContorlChange(_sender:)), for: UIControlEvents.valueChanged)
        self.view.addSubview(pageControl)
        // firstVC
        let firstVC = FirstViewController()
        screenFrame.origin.x = 0
        firstVC.view.frame = screenFrame
        scrollView.addSubview(firstVC.view)
        // secondVC
        let secondVC = SecondViewController()
        screenFrame.origin.x = self.view.width
        secondVC.view.frame = screenFrame
        scrollView.addSubview(secondVC.view)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if !isPageControlUsed{
            let pageWidth = scrollView.width
            let page = floor((scrollView.contentOffset.x - pageWidth/2)/pageWidth) + 1
            pageControl.currentPage = Int(page)
        }
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        isPageControlUsed = false
    }
    
    @objc func pageContorlChange(_sender:AnyObject){
        let currentPage = CGFloat(pageControl.currentPage)
        var frame = scrollView.frame
        frame.origin.x = frame.size.width * currentPage
        frame.origin.y = 0
        scrollView.scrollRectToVisible(frame, animated: true)
        isPageControlUsed = true //
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
