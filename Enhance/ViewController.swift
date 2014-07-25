//
//  ViewController.swift
//  Enhance
//
//  Created by mrJacob on 7/24/14.
//  Copyright (c) 2014 Vokal Interactive. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var mainImageView: UIImageView!
    var imageIsEnhanced : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func enhanceButtonTapped(sender: UIButton) {
        if !imageIsEnhanced {
            var coreImage = CIImage(CGImage: UIImage(named: "OffWhite").CGImage)
            let options = [CIDetectorImageOrientation as String : 1]
            let adjustments = coreImage.autoAdjustmentFiltersWithOptions(options)
            for filter :CIFilter in adjustments as [CIFilter] {
                filter.setValue(coreImage, forKey: kCIInputImageKey);
                coreImage = filter.outputImage
            }
            
            mainImageView.image = UIImage(CIImage: coreImage)
            imageIsEnhanced = true
            /*
            NSDictionary *options = @{ CIDetectorImageOrientation :
            [[image properties] valueForKey:kCGImagePropertyOrientation] };
            NSArray *adjustments = [myImage autoAdjustmentFiltersWithOptions:options];
            for (CIFilter *filter in adjustments) {
            [filter setValue:myImage forKey:kCIInputImageKey];
            myImage = filter.outputImage;
            }
*/
        }
        else {
            self.mainImageView.image = UIImage(named:"OffWhite");
            imageIsEnhanced = false
        }
    }

}

