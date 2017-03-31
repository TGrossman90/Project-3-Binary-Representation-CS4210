//
//  ViewController.h
//  GrossmanTom3
//
//  Created by Tom Grossman on 7/20/16.
//  Copyright © 2016 Tom Grossman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)numberField:(id)sender;
- (IBAction)twoZero:(id)sender;
- (IBAction)twoOne:(id)sender;
- (IBAction)twoTwo:(id)sender;
- (IBAction)twoThree:(id)sender;
- (IBAction)twoFour:(id)sender;
- (IBAction)twoFive:(id)sender;
- (IBAction)twoSix:(id)sender;
- (IBAction)twoSeven:(id)sender;
- (IBAction)signSwitch:(id)sender;
- (IBAction)sliderValue:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *warningLabel;
@property (weak, nonatomic) IBOutlet UITextField *numberField;
@property (weak, nonatomic) IBOutlet UISlider *sliderValue;
@property (weak, nonatomic) IBOutlet UISwitch *twoZero;
@property (weak, nonatomic) IBOutlet UISwitch *twoOne;
@property (weak, nonatomic) IBOutlet UISwitch *twoTwo;
@property (weak, nonatomic) IBOutlet UISwitch *twoThree;
@property (weak, nonatomic) IBOutlet UISwitch *twoFour;
@property (weak, nonatomic) IBOutlet UISwitch *twoFive;
@property (weak, nonatomic) IBOutlet UISwitch *twoSix;
@property (weak, nonatomic) IBOutlet UISwitch *twoSeven;
@property (weak, nonatomic) IBOutlet UISwitch *signSwitch;
@property (weak, nonatomic) IBOutlet UILabel *twoZeroLabel;
@property (weak, nonatomic) IBOutlet UILabel *twoOneLabel;
@property (weak, nonatomic) IBOutlet UILabel *twoTwoLabel;
@property (weak, nonatomic) IBOutlet UILabel *twoThreeLabel;
@property (weak, nonatomic) IBOutlet UILabel *twoFourLabel;
@property (weak, nonatomic) IBOutlet UILabel *twoFiveLabel;
@property (weak, nonatomic) IBOutlet UILabel *twoSixLabel;
@property (weak, nonatomic) IBOutlet UILabel *twoSevenLabel;
@property (weak, nonatomic) IBOutlet UILabel *signSwitchLabel;

- (int)getNumberFromSwitchesUnsigned;
- (void)setSwitchesUnsigned;
- (void)clearSwitches;
- (void)setSwitchesSigned;

@end

