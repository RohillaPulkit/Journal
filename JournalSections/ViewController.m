//
//  ViewController.m
//  JournalSections
//
//  Created by Pulkit Rohilla on 02/08/16.
//  Copyright © 2016 PulkitRohilla. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    
    NSArray *arrayColors;
    UIColor *mustardColor;
    
    UIButton *selectedButton;
}

@synthesize btn1, btn2, btn3, btn4, btn5, btn6, btn7;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    mustardColor = [UIColor colorWithRed:255.0/255.0 green:191.0/255.0 blue:73.0/255.0 alpha:1.0f];
    UIColor *grayColor = [UIColor colorWithRed:170.0/255.0 green:170.0/255.0 blue:170.0/255.0 alpha:1.0f];
    UIColor *lightGrayColor = [UIColor colorWithRed:197.0/255.0 green:197.0/255.0 blue:197.0/255.0 alpha:1.0f];
    
    arrayColors = @[grayColor, lightGrayColor];
    
    [self setupIndexView];
    self.label.transform=CGAffineTransformMakeRotation(M_PI_2);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupIndexView{

    NSArray *arrayButtons = @[btn1, btn2, btn3, btn4, btn5, btn6, btn7];
    
    for (int index = 0; index < arrayButtons.count; index++) {
        
        int colorIndex = (index%2==0) ? 0 : 1;
        
        UIColor *tintColor = [arrayColors objectAtIndex:colorIndex];
        UIButton *btn = [arrayButtons objectAtIndex:index];
        
        btn.tag = index;
        btn.tintColor = tintColor;
    }
    
    //Selected Btn2
    selectedButton = btn2;
    
    selectedButton.tintColor = mustardColor;
    
    [self.view bringSubviewToFront:selectedButton];
}

- (IBAction)actionIndexClick:(UIButton *)sender {
    
    if (selectedButton != sender) {
        
        int colorIndex = (selectedButton.tag%2==0) ? 0 : 1;

        UIColor *tintColor = [arrayColors objectAtIndex:colorIndex];
        
        selectedButton.tintColor = tintColor;
        
        [self.view sendSubviewToBack:selectedButton];
    }
    
    selectedButton = sender;
    
    selectedButton.tintColor = mustardColor;
    [self.view bringSubviewToFront:selectedButton];
    [self.view bringSubviewToFront:self.label];
}

@end
