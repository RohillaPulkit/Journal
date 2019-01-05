//
//  JournalIndexView.m
//  JournalSections
//
//  Created by Pulkit Rohilla on 03/08/16.
//  Copyright © 2016 PulkitRohilla. All rights reserved.
//

#import "JournalIndexView.h"

@implementation JournalIndexView{
    
    NSArray *arrayColors, *arrayButtons;
}

@synthesize arraySectionTitles, selectedIndex, selectionColor;

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        if (self.subviews.count == 0) {
            
            [self setupUI];
        }
    }
    
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    
    return self;
}

-(void)prepareForInterfaceBuilder{

    self.backgroundColor = [UIColor lightGrayColor];
}

#pragma mark - UIButton

- (void)actionBtnClick:(UIButton *)sender {
    
    if (selectedIndex != sender.tag) {
        
        int colorIndex = (selectedIndex%2==0) ? 0 : 1;
        
        UIColor *tintColor = [arrayColors objectAtIndex:colorIndex];
        UIButton *prevButton = [arrayButtons objectAtIndex:selectedIndex];
        prevButton.tintColor = tintColor;
        
        [self sendSubviewToBack:prevButton];
    }
    
    sender.tintColor = selectionColor;
    [self bringSubviewToFront:sender];
    
    selectedIndex = sender.tag;
    

}

#pragma mark - Other Methods

-(void)setupUI{
    
//    arraySectionTitles = @[@"G",@"M",@"T",@"D",@"V",@"U",@"S"];
    UIButton *prevButton;
    UIImage *imgSection = [UIImage imageNamed:@"Section"];
    
    UIColor *grayColor = [UIColor colorWithRed:170.0/255.0 green:170.0/255.0 blue:170.0/255.0 alpha:1.0f];
    UIColor *lightGrayColor = [UIColor colorWithRed:197.0/255.0 green:197.0/255.0 blue:197.0/255.0 alpha:1.0f];
    
    arrayColors = @[grayColor, lightGrayColor];

    NSMutableArray *mArrayButtons = [NSMutableArray new];
    
    for (int index = 0; index < arraySectionTitles.count; index++) {
        
        UIButton *btnSection = [UIButton buttonWithType:UIButtonTypeCustom];
        btnSection.tag = index;
        btnSection.translatesAutoresizingMaskIntoConstraints = NO;
        
        [btnSection setBackgroundImage:imgSection forState:UIControlStateNormal];
        [btnSection setTitle:[arraySectionTitles objectAtIndex:index] forState:UIControlStateNormal];
        [btnSection setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
       
        [btnSection addTarget:self action:@selector(actionBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        //SetTint
        int colorIndex = (index%2==0) ? 0 : 1;
        UIColor *tintColor = [arrayColors objectAtIndex:colorIndex];
        
        btnSection.tintColor = tintColor;
        
        [self addSubview:btnSection];
        
        NSDictionary *viewsDictionary;
        
        if (prevButton) {
            
            viewsDictionary = NSDictionaryOfVariableBindings(btnSection, prevButton);
        }
        else
        {
            viewsDictionary = NSDictionaryOfVariableBindings(btnSection);
        }
        
        
        NSArray *arrayHConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[btnSection]-0-|"
                                                                             options:NSLayoutFormatAlignAllCenterY
                                                                             metrics:nil
                                                                               views:viewsDictionary];
        NSArray * arrayVConstraints;
        
        if (index == 0) {

            arrayVConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[btnSection]"
                                                                                  options:NSLayoutFormatAlignAllCenterX
                                                                                  metrics:nil
                                                                                    views:viewsDictionary];

        }
        else if(index == arraySectionTitles.count - 1)
        {
            arrayVConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[prevButton]-(-10)-[btnSection(==prevButton)]-0-|"
                                                                                  options:NSLayoutFormatAlignAllCenterX
                                                                                  metrics:nil
                                                                                    views:viewsDictionary];
        }
        else
        {
            
            arrayVConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[prevButton]-(-10)-[btnSection(==prevButton)]"
                                                                                  options:NSLayoutFormatAlignAllCenterX
                                                                                  metrics:nil
                                                                                    views:viewsDictionary];
        }
        
        [self addConstraints:arrayHConstraints];
        [self addConstraints:arrayVConstraints];
        
        prevButton = btnSection;
        [self sendSubviewToBack:prevButton];

        [mArrayButtons addObject:btnSection];
        
        if (index == selectedIndex) {
            
            btnSection.tintColor = selectionColor;
            [self bringSubviewToFront:btnSection];
        }
    }
    
    arrayButtons = mArrayButtons;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
