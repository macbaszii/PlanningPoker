//
//  ODViewController.m
//  ODPlaningPoker
//
//  Created by Methuz Kaewsai-kao on 5/30/55 BE.
//  Copyright (c) 2555 joinstick.net@gmail.com. All rights reserved.
//

#import "ODViewController.h"
#import "ODInfoViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ODViewController () {
    UIImageView *bigBackCard;
    UIImageView *bigFrontCard;
}

@end

@implementation ODViewController
@synthesize allCardView;

- (void)showCardWithSelectedCard:(NSString *)selected {
    bigBackCard = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 280, 355)];
    bigFrontCard = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 280, 355)];
    
    bigBackCard.image = [UIImage imageNamed:@"crad-behide_03.png"];
    bigFrontCard.image = [UIImage imageNamed:selected];
    
    bigBackCard.alpha = 0.0;
    //bigFrontCard.alpha = 0.0;
    
    bigBackCard.userInteractionEnabled = YES;
    bigFrontCard.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *bigBackCardTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bigBackCardTapHandle)];
    [bigBackCard addGestureRecognizer:bigBackCardTap];
    
    UITapGestureRecognizer *bigFrontCardTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bigFrontCardTapHandle)];
    [bigFrontCard addGestureRecognizer:bigFrontCardTap];
    
    [self.view addSubview:bigBackCard];
    
    [UIView animateWithDuration:1.0 animations:^{
        bigBackCard.alpha = 1.0;
    }];
}

- (void)bigBackCardTapHandle {
    [UIView transitionWithView:bigBackCard duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft 
                    animations:^{
                        bigBackCard.image = bigFrontCard.image;
    } 
                    completion:^(BOOL finished){
                        [self.view addSubview:bigFrontCard];
                        [bigBackCard removeFromSuperview];
    }];
}

- (void)bigFrontCardTapHandle {
    [UIView animateWithDuration:0.75 animations:^{
        self.allCardView.alpha = 1.0;
        bigFrontCard.alpha = 0.0; 
    }];
}

- (void)addTapGestureToImageView:(UIImageView *)imageView {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandle:)];
    [imageView addGestureRecognizer:tapGesture];
}

- (void)setInteraction {
    NSArray *imageViews = [NSArray arrayWithObjects:zeroImage,oneImage,twoImage,threeImage,fiveImage,eightImage,thirteenImage,bigImage,questionImage, nil];
    
    for (UIImageView *item in imageViews) {
        item.userInteractionEnabled = YES;
        [self addTapGestureToImageView:item];
        item.clipsToBounds = YES;
        item.layer.cornerRadius = 10.0f;
    }
}

- (void)tapHandle:(UITapGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateEnded) {
        NSLog(@"xxxx");
    }
    
    NSString *selectedCard;
    
    if ([gesture.view isEqual:zeroImage]) {
        selectedCard = @"bigcard-0.png";
    } else if ([gesture.view isEqual:oneImage]) {
        selectedCard = @"bigcard-1.png";
    } else if ([gesture.view isEqual:twoImage]) {
        selectedCard = @"bigcard-3.png";
    } else if ([gesture.view isEqual:threeImage]) {
        selectedCard = @"bigcard-3.png";
    } else if ([gesture.view isEqual:fiveImage]) {
        selectedCard = @"bigcard-5.png";
    } else if ([gesture.view isEqual:eightImage]) {
        selectedCard = @"bigcard-8.png";
    } else if ([gesture.view isEqual:thirteenImage]) {
        selectedCard = @"bigcard-13.png";
    } else if ([gesture.view isEqual:bigImage]) {
        selectedCard = @"bigcard-big.png";
    } else if ([gesture.view isEqual:questionImage]) {
        selectedCard = @"bigcard--.png";
    }

    NSLog(@"%@",selectedCard);
    
    [UIView animateWithDuration:0.5 animations:^{
        self.allCardView.alpha = 0.0;
    }];
    
    [self showCardWithSelectedCard:selectedCard];
}

- (void)infoTapHandle {
    ODInfoViewController *infoController = [[ODInfoViewController alloc] init];
    infoController.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    [self presentModalViewController:infoController animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setInteraction];
    infoView.userInteractionEnabled = YES;
    UITapGestureRecognizer *infoTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(infoTapHandle)];
    [infoView addGestureRecognizer:infoTap];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
