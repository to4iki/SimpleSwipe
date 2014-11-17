//
//  ViewController.swift
//  SimpleSwipe
//
//  Created by to4iki on 11/17/14.
//  Copyright (c) 2014 to4iki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var pageControl: UIPageControl!
    
    let BETWEEN_WIDTH = CGFloat(5)
    let NUMPAGES = 3
    var barColor = UIColor.lightGrayColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavigation()
        initScrollView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func initNavigation() {
        self.navigationController?.navigationBar.barTintColor = barColor
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
    
    private func initScrollView() {
        scrollView.contentSize = CGSizeMake((view.frame.size.width + BETWEEN_WIDTH * 2) * CGFloat(NUMPAGES), view.frame.size.height)
        scrollView.pagingEnabled = true // paging enabled
        scrollView.scrollEnabled = true // scroll enabled
        scrollView.directionalLockEnabled = true // スクロール方向のロック
        scrollView.showsHorizontalScrollIndicator = false // 横スクロールバー非表示
        scrollView.showsVerticalScrollIndicator = true // 縦スクロールバー表示
        scrollView.bounces = true
        scrollView.scrollsToTop = false
        scrollView.delegate = self
        
        let superSize = view.frame.size
        
        /// View1
        let redView = UIView(frame: CGRect(
            x: BETWEEN_WIDTH,
            y: 0,
            width: superSize.width,
            height: superSize.height)
        )
        redView.backgroundColor = UIColor.redColor()
        scrollView.addSubview(redView)

        /// View2
        let blueView = UIView(frame: CGRect(
            x: superSize.width + BETWEEN_WIDTH * 3,
            y: 0,
            width: superSize.width,
            height: superSize.height)
        )
        blueView.backgroundColor = UIColor.blueColor()
        scrollView.addSubview(blueView)

        /// View3
        let yellowView = UIView(frame: CGRect(
            x: ((superSize.width + BETWEEN_WIDTH * 3) * 2) - BETWEEN_WIDTH,
            y: 0,
            width: superSize.width,
            height: superSize.height)
        )
        yellowView.backgroundColor = UIColor.yellowColor()
        scrollView.addSubview(yellowView)
        
        view.addSubview(scrollView)
    }
    
    func scrollViewDidScroll(scrollview: UIScrollView) {
        let pageWidth = self.scrollView.frame.size.width
        let fractionalPage = Double(self.scrollView.contentOffset.x / pageWidth)
        let page = lround(fractionalPage)
        
        // pageControlの同期
        self.pageControl.currentPage = page
    }
}
