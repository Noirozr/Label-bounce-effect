//
//  ViewController.m
//  neo1
//
//  Created by Yongjia Liu on 13-6-17.
//  Copyright (c) 2013年 Yongjia Liu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property IBOutlet UITextField *textfield;
@property IBOutlet UILabel *label;

-(IBAction)Click:(id)sender;
-(IBAction)ShowCurrentTime:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)Click:(id)sender
{
    NSString *name=self.textfield.text;
    self.label.text=name;
    CABasicAnimation *spin=[CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    [spin setFromValue:[NSNumber numberWithFloat:M_PI*0.5]];
    [spin setToValue:[NSNumber numberWithFloat:M_PI*0.0]];
    [spin setDuration:1.0];
    [self.view.layer addAnimation:spin forKey:@"spinAnimation"];
    CABasicAnimation *opac=[CABasicAnimation animationWithKeyPath:@"opacity"];
    [opac setFromValue:[NSNumber numberWithFloat:0.0]];
    [opac setToValue:[NSNumber numberWithFloat:1.0]];
    [opac setDuration:1.0];
    [self.view.layer addAnimation:opac forKey:@"opacity"];
    /*CATransform3D trans=CATransform3DIdentity;
    trans.m34=-1.0/2000;
    trans=CATransform3DRotate(trans, 60.0f * M_PI / 180.0f, 0.0f, 1.0f, 0.0f);
    self.view.layer.transform=trans;*/
    
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.textfield) {
        [theTextField resignFirstResponder];
    }
    return YES;
}
-(IBAction)ShowCurrentTime:(id)sender
{
    
    CAKeyframeAnimation *bounce=[CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    CATransform3D forward=CATransform3DMakeScale(1, 1.3, 0);
    CATransform3D back=CATransform3DMakeScale(1, 0.7, 1);
    CATransform3D forward2=CATransform3DMakeScale(1.3, 1.3, 1);
    CATransform3D back2=CATransform3DMakeScale(0.9, 0.9, 1);
    [bounce setValues:[NSArray arrayWithObjects:[NSValue valueWithCATransform3D:CATransform3DIdentity],
                       [NSValue valueWithCATransform3D:forward],
                       [NSValue valueWithCATransform3D:back],
                       [NSValue valueWithCATransform3D:forward2],
                       [NSValue valueWithCATransform3D:back2],
                       [NSValue valueWithCATransform3D:CATransform3DIdentity],
                       nil]];
    [bounce setDuration:0.6];
    [[self.label layer] addAnimation:bounce forKey:@"bounceAnimation"];
    
}
@end
