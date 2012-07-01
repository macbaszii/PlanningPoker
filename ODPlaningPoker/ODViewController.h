//
//  ODViewController.h
//  ODPlaningPoker
//
//  Created by Methuz Kaewsai-kao on 5/30/55 BE.
//  Copyright (c) 2555 joinstick.net@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ODViewController : UIViewController {
    IBOutlet UIImageView *zeroImage, *oneImage, *twoImage, *threeImage, *fiveImage, *eightImage, *thirteenImage, *bigImage, *questionImage;
    
    IBOutlet UIImageView *infoView;
}

@property (nonatomic, weak) IBOutlet UIView *allCardView;

@end
