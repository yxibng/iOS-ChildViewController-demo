//
//  FirstViewController.swift
//  UIViewController-demo
//
//  Created by yxibng on 2020/4/4.
//  Copyright © 2020 yxibng. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    let child = ViewController_Child_1.init(nibName: "ViewController_Child_1", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func onClickAdd(_ sender: Any) {
        
        if child.parent != nil {
            return
        }
        
        addChildViewController(child)
        child.view.isHidden = false
        var frame = self.view.bounds
        frame.size.height = frame.height / 2
        child.view.frame = frame
        
        setNeedsStatusBarAppearanceUpdate()
    }
    
    @IBAction func onClickRemove(_ sender: Any) {
        child.removeFromParentController()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    
    
    @IBAction func onClickShow(_ sender: Any) {
        
        child.beginAppearanceTransition(true, animated: true)
        UIView.animate(withDuration: 2.0, animations: {
            self.child.view.isHidden = false
        }) { (finished) in
            self.child.endAppearanceTransition()
        }
    }
    
    @IBAction func onClickHide(_ sender: Any) {
        child.beginAppearanceTransition(true, animated: true)
        UIView.animate(withDuration: 2.0, animations: {
            self.child.view.isHidden = true
        }) { (finished) in
            self.child.endAppearanceTransition()
        }
    }
    
    override var shouldAutomaticallyForwardAppearanceMethods: Bool {
        return false
    }
    
    override var childForStatusBarStyle: UIViewController? {
        
        if child.parent != nil {
            return child
        }
        return nil
        
    }
    
    override var childForStatusBarHidden: UIViewController? {
        
        if child.parent != nil {
            return child
        }
        return nil
    }
    
    override var childForHomeIndicatorAutoHidden: UIViewController? {
        
        if child.parent != nil {
            return child
        }
        return nil
    }
}

