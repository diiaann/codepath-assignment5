//
//  ImageTransition.swift
//  Facebook
//
//  Created by Diandian Xiao on 3/6/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        let newsFeedViewController = fromViewController as! NewsFeedViewController
        let photoViewController = toViewController as! PhotoViewController

        let movingImageView = UIImageView()
        var frame = CGRect()
        
        
        frame = containerView.convertRect(newsFeedViewController.selectedImage.frame, fromView: newsFeedViewController.scrollView)
        
        movingImageView.frame = frame
        movingImageView.image = newsFeedViewController.selectedImage.image
        
        movingImageView.clipsToBounds = newsFeedViewController.selectedImage.clipsToBounds
        
        
        movingImageView.contentMode = newsFeedViewController.selectedImage.contentMode
        print("image", movingImageView.image)

        containerView.addSubview(movingImageView)
        
        photoViewController.view.alpha = 0
        photoViewController.imageView.alpha = 0
        newsFeedViewController.selectedImage.alpha = 0
        
        UIView.animateWithDuration(duration, animations: {
            photoViewController.view.alpha = 1
            movingImageView.frame = photoViewController.imageView.frame
            movingImageView.image = photoViewController.imageView.image
            movingImageView.clipsToBounds = photoViewController.imageView.clipsToBounds
            }) { (finished: Bool) -> Void in
                photoViewController.imageView.alpha = 1
                newsFeedViewController.selectedImage.alpha = 1
                movingImageView.removeFromSuperview()
                
                
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        let newsFeedViewController = toViewController as! NewsFeedViewController
        let photoViewController = fromViewController as! PhotoViewController
        let movingImageView = UIImageView()
        var newsFrame = CGRect()
        var photoFrame = CGRect()
        
        
        photoFrame = containerView.convertRect(photoViewController.imageView.frame, fromView: photoViewController.scrollView)
        newsFrame = containerView.convertRect(newsFeedViewController.selectedImage.frame, fromView: newsFeedViewController.scrollView)
        movingImageView.contentMode = photoViewController.imageView.contentMode
        
        photoViewController.imageView.alpha = 0
        newsFeedViewController.selectedImage.alpha = 0
        
        movingImageView.frame = photoFrame
        movingImageView.image = photoViewController.imageView.image
        movingImageView.clipsToBounds = photoViewController.imageView.clipsToBounds
        
        containerView.addSubview(movingImageView)
        
        UIView.animateWithDuration(duration, animations: {
            photoViewController.view.alpha = 0
            movingImageView.frame = newsFrame
            movingImageView.image = newsFeedViewController.selectedImage.image
            movingImageView.clipsToBounds = newsFeedViewController.selectedImage.clipsToBounds
            }) { (finished: Bool) -> Void in
                photoViewController.imageView.alpha = 1
                newsFeedViewController.selectedImage.alpha = 1
                movingImageView.removeFromSuperview()
                self.finish()
                
        }
    }

}
