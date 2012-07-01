//
//  ODInfoViewController.m
//  ODPlaningPoker
//
//  Created by Methuz Kaewsai-kao on 5/30/55 BE.
//  Copyright (c) 2555 joinstick.net@gmail.com. All rights reserved.
//

#import "ODInfoViewController.h"

@interface ODInfoViewController ()
    
@end

@implementation ODInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UIImageView *info = [[UIImageView alloc] initWithFrame:self.view.bounds];
        info.image = [UIImage imageNamed:@"infoScrum.png"];
        info.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandle)];
        [info addGestureRecognizer:tapGesture];
        [self.view addSubview:info];
    }
    return self;
}

- (void)tapHandle {
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
