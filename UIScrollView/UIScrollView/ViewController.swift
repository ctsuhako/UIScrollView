//
//  ViewController.swift
//  UIScrollView
//
//  Created by Clay Tsuhako on 8/18/16.
//  Copyright © 2016 Clay Tsuhako. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var images = [UIImageView]()
    //Create array to hold the images
    

    override func viewDidLoad() {
        super.viewDidLoad()
        


    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        var contentWidth: CGFloat = 0.0
        //Setting the content size of the scrollView. A scrollView has it's own screen boundaries, but it also has content that can go off the screen (i.e., if the screen was 300 wide and you wanted 2 screens of content, the content size would be 600; 3 screens=900, etc.). This lets the scrollView know how far it needs to scroll. Above, we are creating a variable to store that content width, initialized to 0. This will be referenced below (contentWidth += newX).
        
        print("Scrollview width: \(scrollView.frame.size.width)")
        
        let scrollWidth = scrollView.frame.size.width
        
        for x in 0...2{
            let image = UIImage(named: "icon\(x).png")
            // Will loop three times and create an image
            let imageView = UIImageView(image: image)
            
            //Above creates a reference to UIImageView so we know what is on the screen and so that we can manipulate it
            
            images.append(imageView)
            // Creates the ImageView and appends them to the images array. Initialized with (image: image)
            
            var newX: CGFloat = 0.0
            newX = scrollWidth / 2 + scrollWidth * CGFloat(x)
            // newX is view.frame.midX (the location of the view on the screen at the top and middle) + view.frame.size.width (the width of the view) * CGFloat(x) (the index from the array). On the first index (0), the view will not move (0 + 400 * 0 = 0).On the second index (1), the view will move over one full screen (0 + 400 * 1 = 400) and so on.
            
            contentWidth += newX
            
            scrollView.addSubview(imageView)
            // Adding imageView to the subView
            
            imageView.frame = CGRect(x: newX - 75, y: (scrollView.frame.size.height / 2) - 75, width: 150, height: 150)
            // Give a frame on the image (which currently has an arbritray width and height) after it has been added to the scrollView to ensure that we have the new coordinate system in place. A view's coordinate system is dependent on it's parent. The first image in the array will show, pinned to the left at 0 (x), pinned in the center (y which equals half the height of the screen)
        }
        
        scrollView.clipsToBounds = false
        
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
        // Setting content size of the scrollView.
    }

}

