//
//  HZSampleCollectionViewController.swift
//  HZSwiftUIKIT
//
//  Created by 华天杰 on 2018/10/17.
//  Copyright © 2018年 HZ. All rights reserved.
//

import UIKit

class HZSampleCollectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    var images:[String] = []
    var collectionView:UICollectionView?
    let identifier = "reuseCell"
    
    var itemWidth:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        let margin:CGFloat = 15.0
        
        itemWidth = (self.view.width - margin * 4 ) / 3
        // 初始化数据
        for i in  1 ..< 10{
            images.append("\(i)")
        }
        // 设置布局
        let flowLayout = UICollectionViewFlowLayout()
       // flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        flowLayout.scrollDirection = UICollectionViewScrollDirection.vertical
        
        // 设置UI
        let frame = UIView.adjustScrollViewFrame(self)
        collectionView = UICollectionView(frame: frame, collectionViewLayout: flowLayout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: identifier)
        collectionView?.backgroundColor = UIColor.white
        self.view.addSubview(collectionView!)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        let imageView:UIImageView? = cell.viewWithTag(1) as? UIImageView
        if imageView == nil {
            let image = UIImage(named: images[indexPath.row])
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: 0, y: 0, width: itemWidth, height: itemWidth)
            imageView.layer.opacity = 0.5
            imageView.tag = 1
            cell.addSubview(imageView)
        }else{
            imageView?.image = UIImage(named: images[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        let imageView = cell?.viewWithTag(1)
        imageView?.layer.opacity = 1.0
    }
    
    // 设置每一个Item的大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: itemWidth, height: itemWidth)
    }
    //定义每个section的四边间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    //两行cell之间的间距（上下行cell的间距）
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    //两行cell之间的间距（同一行cell的间距）
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15;
    }
}
