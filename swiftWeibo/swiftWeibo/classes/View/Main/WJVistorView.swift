//
//  WJVistorView.swift
//  swiftWeibo
//
//  Created by 龚文娟 on 17/10/4.
//  Copyright © 2017年 l. All rights reserved.
//

import UIKit

class WJVistorView: UIView {
    
   // var vistorInfo:[String]
    
    override init(frame: CGRect){

        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
    
    fileprivate lazy var cycleView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    
    fileprivate lazy var houseView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    
    fileprivate lazy var tipLabel: UILabel = {
        
        let label = UILabel()
        label.text = "关注一些人,回这里看看有什么惊喜,关注一些人,回这里看看有什么惊喜"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.darkGray
        label.sizeToFit()
        return label
    }()
    
    fileprivate lazy var coverView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    
    var vistorInfo:[String:String]? {
        
        didSet {
            
            let imageName = vistorInfo?["imageName"]
            let testStr = vistorInfo?["labelText"]
            
            if ((imageName?.characters.count))! > 0 {
                
                coverView.isHidden = true
                cycleView.isHidden = true
                houseView.image = UIImage(named: imageName!)
                tipLabel.text = testStr
                
            } else {
                
                startAnima()
            }
        }
    }
}

extension WJVistorView {
    
    fileprivate func startAnima() {
        let anima = CABasicAnimation()
        anima.fromValue = 0
        anima.toValue = 2 * M_PI
        anima.repeatCount = MAXFLOAT
        anima.duration = 15
        //这一步很重要,不写的话从其他界面切换回来或者按home键退出再进来就不转了
        anima.isRemovedOnCompletion = false
        cycleView.layer.add(anima, forKey: "transform.rotation")
    }
    
    fileprivate func setUpUI() {

        //self.backgroundColor = UIColor(colorLiteralRed: 245.0, green: 245.0, blue: 245.0, alpha: 1.0)
        addSubview(cycleView)
        addSubview(houseView)
        addSubview(tipLabel)
        addSubview(coverView)
        
        //一定要先取消resizing,否则自动布局无效
        for item in subviews {
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        //圆圈
        addConstraint(NSLayoutConstraint(item: cycleView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: cycleView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: -40))
        
        //房子
        addConstraint(NSLayoutConstraint(item: houseView, attribute: .centerX, relatedBy: .equal, toItem: cycleView, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: houseView, attribute: .centerY, relatedBy: .equal, toItem: cycleView, attribute: .centerY, multiplier: 1, constant: 0))
        
        //文字
        addConstraint(NSLayoutConstraint(item: tipLabel, attribute: .top, relatedBy: .equal, toItem: houseView, attribute: .bottom, multiplier: 1, constant: 20))
        addConstraint(NSLayoutConstraint(item: tipLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 269))
                addConstraint(NSLayoutConstraint(item: tipLabel, attribute: .centerX, relatedBy: .equal, toItem: houseView, attribute: .centerX, multiplier: 1, constant: 0))
        
        //cover
        addConstraint(NSLayoutConstraint(item: coverView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: coverView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: coverView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: coverView, attribute: .bottom, relatedBy: .equal, toItem: houseView, attribute: .bottom, multiplier: 1, constant: 180))
        
    }
}
