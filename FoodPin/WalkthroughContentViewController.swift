//
//  WalkthroughContentViewController.swift
//  FoodPin
//
//  Created by Xiulan Shi on 2/2/16.
//  Copyright © 2016 Xiulan Shi. All rights reserved.
//

import UIKit

class WalkthroughContentViewController: UIViewController {

    @IBOutlet var headingLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var contentImageView: UIImageView!
    
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var forwardButton: UIButton!
    
    var index = 0
    var heading = ""
    var imageFile = ""
    var content = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        headingLabel.text = heading
        contentLabel.text = content
        contentImageView.image = UIImage(named: imageFile)
        
        pageControl.currentPage = index
        
        
        if case 0...1 = index {
            forwardButton.setTitle("NEXT", forState: UIControlState.Normal)
        } else if case 2 = index {
            forwardButton.setTitle("DONE", forState: UIControlState.Normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonTapped(sender: UIButton) {
        
        switch index {
        case 0...1:
            let pageViewController = parentViewController as! WalkthroughPageViewController
            
            pageViewController.forward(index)
            
        case 2:
            dismissViewControllerAnimated(true, completion: nil)
            
        default: break
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
