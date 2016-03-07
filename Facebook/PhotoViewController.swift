//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Diandian Xiao on 3/6/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    var image: UIImage!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bgView: UIView!

    @IBOutlet weak var photoActionImageView: UIImageView!
    @IBOutlet weak var doneImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        scrollView.contentSize = CGSize(width: 320, height: 568)
        scrollView.delegate = self
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didTapDone(sender: UITapGestureRecognizer) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        
        UIView.animateWithDuration(0.3, animations: {
            self.photoActionImageView.alpha = 0
            self.doneImageView.alpha = 0
        })
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        
        print("contentOffset", scrollView.contentOffset.y)
        let alphaValue = 1 - (abs(scrollView.contentOffset.y)/200)

        bgView.backgroundColor = UIColor(white: 0, alpha: alphaValue)
        // This method is called as the user scrolls
    }

    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
    
            if (abs(scrollView.contentOffset.y) > 100 ){
                dismissViewControllerAnimated(true, completion: nil)
            }
            
            else {
                UIView.animateWithDuration(0.3, animations: {
                    self.photoActionImageView.alpha = 1
                    self.doneImageView.alpha = 1
                })
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
