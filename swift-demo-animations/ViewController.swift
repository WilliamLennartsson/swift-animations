//
//  ViewController.swift
//  swift-demo-animations
//
//  Created by William Lennartsson on 2019-04-10.
//  Copyright © 2019 William Lennartsson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let headerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        return view
    }()
    
    let profileText: UITextView = {
        let text = UITextView(frame: .zero)
        return text
    }()
    
    let profileImageView: UIImageView = {
        let image = UIImage(named: "hedgehog.jpg")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    func setupUI(){
        let screenSize = UIScreen.main.bounds
        let screenH = screenSize.height
        let screenW = screenSize.width
        
        let headerFrame = CGRect(x: screenW / 4, y: 100, width: screenW / 2, height: 50)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(toggleProfile))
        headerView.frame = headerFrame
        headerView.addGestureRecognizer(gesture)
        view.addSubview(headerView)
        
        profileImageView.frame = CGRect(x: 50, y: 80, width: screenW - 100, height: 150)
        profileImageView.alpha = 0
        view.addSubview(profileImageView)
    }
    
    var isToggled = false
    @objc func toggleProfile(){
        if (!isToggled){
            showProfile()
        } else {
            hideProfile()
        }
        isToggled = !isToggled
    }
    
    func showProfile(){
        UIView.animate(withDuration: 2, animations: {
            self.headerView.transform = CGAffineTransform(scaleX: 2, y: 1)
        }) { (finished) in
            UIImageView.animate(withDuration: 2, animations: {
                self.profileImageView.alpha = 1
            })
            UIView.animate(withDuration: 1, animations: {
                self.headerView.transform = CGAffineTransform(scaleX: 2, y: 6)
            })
        }
    }
    
    func hideProfile(){
        UIImageView.animate(withDuration: 2, animations: {
            self.profileImageView.alpha = 0
        }) { (finished) in
            UIView.animate(withDuration: 2, animations: {
                self.headerView.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        }
        
    }

}

