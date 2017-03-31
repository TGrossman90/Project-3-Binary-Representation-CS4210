//
//  ViewController.m
//  GrossmanTom3
//
//  Created by Tom Grossman on 7/20/16.
//  Copyright © 2016 Tom Grossman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property int theNumber;
@end

@implementation ViewController

-(void)signedOneTwentyEight {
    _numberField.text = @"-128";
    self.clearSwitches;
}

- (void)clearSwitches {
    _warningLabel.text = @"";
    if([_signSwitch isOn]) {
        NSArray *switchArray = [NSArray arrayWithObjects: _twoZero, _twoOne, _twoTwo, _twoThree, _twoFour, _twoFive, _twoSix, _twoSeven, nil];
        for(int x = 0; x < 7; x++) {
            [[switchArray objectAtIndex: x] setOn: NO];
        }
        [_twoSeven setOn: YES];
        _twoZeroLabel.text = @"0";
        _twoOneLabel.text = @"0";
        _twoTwoLabel.text = @"0";
        _twoThreeLabel.text = @"0";
        _twoFourLabel.text = @"0";
        _twoFiveLabel.text = @"0";
        _twoSixLabel.text = @"0";
        _twoSevenLabel.text = @"1 (Sign Bit (Negative)";
    } else {
        NSArray *switchArray = [NSArray arrayWithObjects: _twoZero, _twoOne, _twoTwo, _twoThree, _twoFour, _twoFive, _twoSix, _twoSeven, nil];
        for(int x = 0; x < 8; x++) {
            [[switchArray objectAtIndex: x] setOn: NO];
        }
        
        _twoZeroLabel.text = @"0";
        _twoOneLabel.text = @"0";
        _twoTwoLabel.text = @"0";
        _twoThreeLabel.text = @"0";
        _twoFourLabel.text = @"0";
        _twoFiveLabel.text = @"0";
        _twoSixLabel.text = @"0";
        _twoSevenLabel.text = @"0";
    }
}

- (void)setSwitchesUnsigned {
    _warningLabel.text = @"";
    self.clearSwitches;
    
    NSMutableString *binaryString = [NSMutableString stringWithFormat:@""];
    NSString *num = _numberField.text;
    NSInteger value = num.integerValue;
    
    for(value; value > 0; value >>= 1)
    {
        NSString *bit;
        if(value & 1)
            bit = @"1";
        else
            bit = @"0";
        
        [binaryString insertString: bit atIndex: 0];
    }
    
    while(binaryString.length != 8) {
        [binaryString insertString: @"0" atIndex: 0];
    }
    
    if([binaryString characterAtIndex: 7] == '1') {
        [_twoZero setOn: YES];
        _twoZeroLabel.text = @"1";
    }
    if([binaryString characterAtIndex: 6] == '1') {
        [_twoOne setOn: YES];
        _twoOneLabel.text = @"1";
    }
    if([binaryString characterAtIndex: 5] == '1') {
        [_twoTwo setOn: YES];
        _twoTwoLabel.text = @"1";
    }
    if([binaryString characterAtIndex: 4] == '1') {
        [_twoThree setOn: YES];
        _twoThreeLabel.text = @"1";
    }
    if([binaryString characterAtIndex: 3] == '1') {
        [_twoFour setOn: YES];
        _twoFourLabel.text = @"1";
    }
    if([binaryString characterAtIndex: 2] == '1') {
        [_twoFive setOn: YES];
        _twoFiveLabel.text = @"1";
    }
    if([binaryString characterAtIndex: 1] == '1') {
        [_twoSix setOn: YES];
        _twoSixLabel.text = @"1";
    }
    if([binaryString characterAtIndex: 0] == '1') {
        [_twoSeven setOn: YES];
        _twoSevenLabel.text = @"1";
    }
}

- (void)setSwitchesSigned {
    self.clearSwitches;
    _warningLabel.text = @"";
    
    NSArray *switchArray = [NSArray arrayWithObjects: _twoZero, _twoOne, _twoTwo, _twoThree, _twoFour, _twoFive, _twoSix, _twoSeven, nil];
    NSMutableString *binaryString = [NSMutableString stringWithFormat:@""];
    NSMutableString *binaryStringFlipped = [NSMutableString stringWithFormat: @""];
    NSMutableString *binaryStringFlippedPlusOne = [NSMutableString stringWithFormat: @""];
    NSMutableString *binaryStringFlippedReversed = [NSMutableString stringWithFormat: @""];
    NSMutableString *binaryStringFlippedPlusOneReversed = [NSMutableString stringWithFormat: @""];
    NSString *temp = _numberField.text;
    NSString *num = [temp substringFromIndex: 1];
    NSInteger value = num.integerValue;
    
    for(value; value > 0; value >>= 1)
    {
        NSString *bit;
        if(value & 1)
            bit = @"1";
        else
            bit = @"0";
        
        [binaryString insertString: bit atIndex: 0];
    }
    
    while(binaryString.length != 7) {
        [binaryString insertString: @"0" atIndex: 0];
    }
    
    for(int x = 0; x < binaryString.length; x++) {
        if([binaryString characterAtIndex: x] == '1')
            [binaryStringFlipped insertString: @"0" atIndex: x];
        else
            [binaryStringFlipped insertString: @"1" atIndex: x];
    }
    
    NSInteger index = [binaryStringFlipped length];
    while (index > 0) {
        index--;
        NSRange subStrRange = NSMakeRange(index, 1);
        [binaryStringFlippedReversed appendString:[binaryStringFlipped substringWithRange:subStrRange]];
    }
    
    bool flag = YES;
    for(int x = 0; x < binaryStringFlippedReversed.length; x++) {
        if([binaryStringFlippedReversed characterAtIndex: x] == '0' && flag) {
            [binaryStringFlippedPlusOneReversed insertString: @"1" atIndex: x];
            flag = NO;
        }
        else if([binaryStringFlippedReversed characterAtIndex: x] == '0' && !flag) {
            [binaryStringFlippedPlusOneReversed insertString: @"0" atIndex: x];
        }
        else if([binaryStringFlippedReversed characterAtIndex: x] == '1' && flag) {
            [binaryStringFlippedPlusOneReversed insertString: @"0" atIndex: x];
        }
        else if([binaryStringFlippedReversed characterAtIndex: x] == '1' && !flag)
            [binaryStringFlippedPlusOneReversed insertString: @"1" atIndex: x];
    }
    
    index = [binaryStringFlippedPlusOneReversed length];
    while (index > 0) {
        index--;
        NSRange subStrRange = NSMakeRange(index, 1);
        [binaryStringFlippedPlusOne appendString:[binaryStringFlippedPlusOneReversed substringWithRange:subStrRange]];
    }
    
    if(binaryStringFlippedPlusOne.length < 8)
        [binaryStringFlippedPlusOne insertString: @"1" atIndex: 0];
    
    if([binaryStringFlippedPlusOne characterAtIndex: 7] == '1') {
        [_twoZero setOn: YES];
        _twoZeroLabel.text = @"1";
    }
    if([binaryStringFlippedPlusOne characterAtIndex: 6] == '1') {
        [_twoOne setOn: YES];
        _twoOneLabel.text = @"1";
    }
    if([binaryStringFlippedPlusOne characterAtIndex: 5] == '1') {
        [_twoTwo setOn: YES];
        _twoTwoLabel.text = @"1";
    }
    if([binaryStringFlippedPlusOne characterAtIndex: 4] == '1') {
        [_twoThree setOn: YES];
        _twoThreeLabel.text = @"1";
    }
    if([binaryStringFlippedPlusOne characterAtIndex: 3] == '1') {
        [_twoFour setOn: YES];
        _twoFourLabel.text = @"1";
    }
    if([binaryStringFlippedPlusOne characterAtIndex: 2] == '1') {
        [_twoFive setOn: YES];
        _twoFiveLabel.text = @"1";
    }
    if([binaryStringFlippedPlusOne characterAtIndex: 1] == '1') {
        [_twoSix setOn: YES];
        _twoSixLabel.text = @"1";
    }
    if([binaryStringFlippedPlusOne characterAtIndex: 0] == '1') {
        [_twoSeven setOn: YES];
        _twoSevenLabel.text = @"1 (Sign Bit (Negative))";
    }
}

- (int) getNumberFromSwitchesUnsigned {
    _warningLabel.text = @"";
    int value = 0;
    
    if([_twoZero isOn])
        value += 1;
    if([_twoOne isOn])
        value += 2;
    if([_twoTwo isOn])
        value += 4;
    if([_twoThree isOn])
        value += 8;
    if([_twoFour isOn])
        value += 16;
    if([_twoFive isOn])
        value += 32;
    if([_twoSix isOn])
        value += 64;
    if([_twoSeven isOn])
        value += 128;
    return value;
}

- (int) getNumberFromSwitchesSigned {
    _warningLabel.text = @"";
    int value = -128;
    
    if([_twoZero isOn])
        value += 1;
    if([_twoOne isOn])
        value += 2;
    if([_twoTwo isOn])
        value += 4;
    if([_twoThree isOn])
        value += 8;
    if([_twoFour isOn])
        value += 16;
    if([_twoFive isOn])
        value += 32;
    if([_twoSix isOn])
        value += 64;
    return value;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if([_signSwitch isOn]) {
        NSString *num = _numberField.text;
        int value = (int)num.integerValue;
        if((value > -1) || (value < -128)) {
            _warningLabel.text = @"Number entered is not within the accepted range (-1 to -128)";
            return YES;
        }
    } else {
        NSString *num = _numberField.text;
        int value = (int)num.integerValue;
        if((value > 255) || (value < 0)) {
            _warningLabel.text = @"Number entered is not within the accepted range (0 to 255)";
            return YES;
        }
    }
    if([_signSwitch isOn]) {
        self.setSwitchesSigned;
        NSString *num = _numberField.text;
        _sliderValue.value = num.integerValue;
        _warningLabel.text = @"";
    } else {
        self.setSwitchesUnsigned;
        NSString *num = _numberField.text;
        _sliderValue.value = num.integerValue;
        _warningLabel.text = @"";
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)numberField:(id)sender {
}

- (IBAction)twoZero:(id)sender {
    if([_signSwitch isOn]) {
        if([sender isOn]) {
            _twoZeroLabel.text = @"1";
            _theNumber = self.getNumberFromSwitchesSigned;
            NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
            _numberField.text = value;
            _sliderValue.value = _theNumber;
        } else {
            _twoZeroLabel.text = @"0";
            _theNumber = self.getNumberFromSwitchesSigned;
            NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
            _numberField.text = value;
            _sliderValue.value = _theNumber;
        }
    } else if([sender isOn] && !([_signSwitch isOn])) {
        _twoZeroLabel.text = @"1";
        _theNumber = self.getNumberFromSwitchesUnsigned;
        NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
        _numberField.text = value;
        _sliderValue.value = _theNumber;
    } else if(!([sender isOn]) && !([_signSwitch isOn])) {         _twoZeroLabel.text = @"0";
        _theNumber = self.getNumberFromSwitchesUnsigned;
        NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
        _numberField.text = value;
        _sliderValue.value = _theNumber;
    }
}

- (IBAction)twoOne:(id)sender {
    if([_signSwitch isOn]) {
        if([sender isOn]) {
            _twoOneLabel.text = @"1";
            _theNumber = self.getNumberFromSwitchesSigned;
            NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
            _numberField.text = value;
            _sliderValue.value = _theNumber;
        } else {
            _twoOneLabel.text = @"0";
            _theNumber = self.getNumberFromSwitchesSigned;
            NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
            _numberField.text = value;
            _sliderValue.value = _theNumber;
        }
    } else if([sender isOn] && !([_signSwitch isOn])) {
        _twoOneLabel.text = @"1";
        _theNumber = self.getNumberFromSwitchesUnsigned;
        NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
        _numberField.text = value;
        _sliderValue.value = _theNumber;
    } else if(!([sender isOn]) && !([_signSwitch isOn])) {
        _twoOneLabel.text = @"0";
        _theNumber = self.getNumberFromSwitchesUnsigned;
        NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
        _numberField.text = value;
        _sliderValue.value = _theNumber;
    }
}

- (IBAction)twoTwo:(id)sender {
    if([_signSwitch isOn]) {
        if([sender isOn]) {
            _twoTwoLabel.text = @"1";
            _theNumber = self.getNumberFromSwitchesSigned;
            NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
            _numberField.text = value;
            _sliderValue.value = _theNumber;
        } else {
            _twoTwoLabel.text = @"0";
            _theNumber = self.getNumberFromSwitchesSigned;
            NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
            _numberField.text = value;
            _sliderValue.value = _theNumber;
        }
    } else if([sender isOn] && !([_signSwitch isOn])) {
        _twoTwoLabel.text = @"1";
        _theNumber = self.getNumberFromSwitchesUnsigned;
        NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
        _numberField.text = value;
        _sliderValue.value = _theNumber;
    } else if(!([sender isOn]) && !([_signSwitch isOn])) {         _twoTwoLabel.text = @"0";
        _theNumber = self.getNumberFromSwitchesUnsigned;
        NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
        _numberField.text = value;
        _sliderValue.value = _theNumber;
    }
}

- (IBAction)twoThree:(id)sender {
    if([_signSwitch isOn]) {
        if([sender isOn]) {
            _twoThreeLabel.text = @"1";
            _theNumber = self.getNumberFromSwitchesSigned;
            NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
            _numberField.text = value;
            _sliderValue.value = _theNumber;
        } else {
            _twoThreeLabel.text = @"0";
            _theNumber = self.getNumberFromSwitchesSigned;
            NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
            _numberField.text = value;
            _sliderValue.value = _theNumber;
        }
    } else if([sender isOn] && !([_signSwitch isOn])) {
        _twoThreeLabel.text = @"1";
        _theNumber = self.getNumberFromSwitchesUnsigned;
        NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
        _numberField.text = value;
        _sliderValue.value = _theNumber;
    } else if(!([sender isOn]) && !([_signSwitch isOn])) {         _twoThreeLabel.text = @"0";
        _theNumber = self.getNumberFromSwitchesUnsigned;
        NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
        _numberField.text = value;
        _sliderValue.value = _theNumber;
    }
}

- (IBAction)twoFour:(id)sender {
    if([_signSwitch isOn]) {
        if([sender isOn]) {
            _twoFourLabel.text = @"1";
            _theNumber = self.getNumberFromSwitchesSigned;
            NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
            _numberField.text = value;
            _sliderValue.value = _theNumber;
        } else {
            _twoFourLabel.text = @"0";
            _theNumber = self.getNumberFromSwitchesSigned;
            NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
            _numberField.text = value;
            _sliderValue.value = _theNumber;
        }
    } else if([sender isOn] && !([_signSwitch isOn])) {
        _twoFourLabel.text = @"1";
        _theNumber = self.getNumberFromSwitchesUnsigned;
        NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
        _numberField.text = value;
        _sliderValue.value = _theNumber;
    } else if(!([sender isOn]) && !([_signSwitch isOn])) {         _twoFourLabel.text = @"0";
        _theNumber = self.getNumberFromSwitchesUnsigned;
        NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
        _numberField.text = value;
        _sliderValue.value = _theNumber;
    }
}

- (IBAction)twoFive:(id)sender {
    if([_signSwitch isOn]) {
        if([sender isOn]) {
            _twoFiveLabel.text = @"1";
            _theNumber = self.getNumberFromSwitchesSigned;
            NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
            _numberField.text = value;
            _sliderValue.value = _theNumber;
        } else {
            _twoFiveLabel.text = @"0";
            _theNumber = self.getNumberFromSwitchesSigned;
            NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
            _numberField.text = value;
            _sliderValue.value = _theNumber;
        }
    } else if([sender isOn] && !([_signSwitch isOn])) {
        _twoFiveLabel.text = @"1";
        _theNumber = self.getNumberFromSwitchesUnsigned;
        NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
        _numberField.text = value;
        _sliderValue.value = _theNumber;
    } else if(!([sender isOn]) && !([_signSwitch isOn])) {         _twoFiveLabel.text = @"0";
        _theNumber = self.getNumberFromSwitchesUnsigned;
        NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
        _numberField.text = value;
        _sliderValue.value = _theNumber;
    }
}

- (IBAction)twoSix:(id)sender {
    if([_signSwitch isOn]) {
        if([sender isOn]) {
            _twoSixLabel.text = @"1";
            _theNumber = self.getNumberFromSwitchesSigned;
            NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
            _numberField.text = value;
            _sliderValue.value = _theNumber;
        } else {
            _twoSixLabel.text = @"0";
            _theNumber = self.getNumberFromSwitchesSigned;
            NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
            _numberField.text = value;
            _sliderValue.value = _theNumber;
        }
    } else if([sender isOn] && !([_signSwitch isOn])) {
        _twoSixLabel.text = @"1";
        _theNumber = self.getNumberFromSwitchesUnsigned;
        NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
        _numberField.text = value;
        _sliderValue.value = _theNumber;
    } else if(!([sender isOn]) && !([_signSwitch isOn])) {         _twoSixLabel.text = @"0";
        _theNumber = self.getNumberFromSwitchesUnsigned;
        NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
        _numberField.text = value;
        _sliderValue.value = _theNumber;
    }
}

- (IBAction)twoSeven:(id)sender {
    if([_signSwitch isOn]) {
        if([sender isOn]) {
            _twoSevenLabel.text = @"1 (Sign Bit (Negative)";
            _theNumber = self.getNumberFromSwitchesSigned;
            NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
            _numberField.text = value;
            _sliderValue.value = _theNumber;
        } else {
            [sender setOn:YES];
            _twoSevenLabel.text = @"1 (Sign Bit (Negative)";
            _theNumber = self.getNumberFromSwitchesSigned;
            NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
            _numberField.text = value;
            _sliderValue.value = _theNumber;
        }
    } else if([sender isOn] && !([_signSwitch isOn])) {
        _twoSevenLabel.text = @"1";
        _theNumber = self.getNumberFromSwitchesUnsigned;
        NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
        _numberField.text = value;
        _sliderValue.value = _theNumber;
    } else if(!([sender isOn]) && !([_signSwitch isOn])) {         _twoSevenLabel.text = @"0";
        _theNumber = self.getNumberFromSwitchesUnsigned;
        NSString *value = [NSString stringWithFormat: @"%d", _theNumber];
        _numberField.text = value;
        _sliderValue.value = _theNumber;
    }
}

- (IBAction)signSwitch:(id)sender {
    if([sender isOn]) {
        _signSwitchLabel.text = @"Negative";
        _sliderValue.minimumValue = -128;
        _sliderValue.maximumValue = -1;
        _sliderValue.value = -128;
        _numberField.text = @"-128";
        self.clearSwitches;
        _twoSevenLabel.text = @" 1 (Sign Bit (Negative))";
        [_twoSeven setOn: YES];
    } else {
        _signSwitchLabel.text = @"Positive";
        _sliderValue.minimumValue = 0;
        _sliderValue.maximumValue = 255;
        _sliderValue.value = 0;
        _numberField.text = @"0";
        self.clearSwitches;
    }
}

- (IBAction)sliderValue:(id)sender {
    if([_signSwitch isOn]) {
        int value = _sliderValue.value;
        NSString *sValue = [NSString stringWithFormat: @"%d", value];
        _numberField.text = sValue;
        self.setSwitchesSigned;
    } else {
        int value = _sliderValue.value;
        NSString *sValue = [NSString stringWithFormat: @"%d", value];
        _numberField.text = sValue;
        self.setSwitchesUnsigned;
    }
}

@end
