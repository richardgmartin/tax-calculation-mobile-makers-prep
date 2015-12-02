//
//  ViewController.m
//  TaxCalculator
//
//  Created by Richard Martin on 2015-12-02.
//  Copyright © 2015 richard martin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITextField *priceTextField;

@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property (strong, nonatomic) IBOutlet UILabel *resultLabel;

@property (nonatomic) double caTax;

@property (nonatomic) double chiTax;

@property (nonatomic) double nyTax;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.caTax = .075;
    self.chiTax = .0925;
    self.nyTax = .045;
    
}

- (IBAction)onCalculateButtonTapped:(id)sender {
    
    // retreive text from priceTextField, convert to int and assign to local variable
    
    NSString *priceInCents = [self.priceTextField text];
    
    NSUInteger price = [priceInCents integerValue];
    
    // multiply price and local tax rate
    
    int totalTax = 0;
    
    if (self.segmentedControl.selectedSegmentIndex == 0 ) {
        totalTax = self.caTax * price;
    }
    
    if (self.segmentedControl.selectedSegmentIndex == 1 ) {
        totalTax = self.chiTax * price;
    }
    
    if (self.segmentedControl.selectedSegmentIndex == 2 ) {
        totalTax = self.nyTax * price;
    }
    
    // assign totalTax value to resultLabel
    
    NSNumber *totalTaxValue = @(totalTax);
    
    self.resultLabel.text = [totalTaxValue stringValue];
    
    
}


@end
