//
//  JournalIndexView.h
//  JournalSections
//
//  Created by Pulkit Rohilla on 03/08/16.
//  Copyright © 2016 PulkitRohilla. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JournalIndexView;

@protocol JournalIndexViewDelegate <NSObject>

-(void)didChangeJournalIndex:(JournalIndexView *)sender;

@end

IB_DESIGNABLE
@interface JournalIndexView : UIView

@property (assign, nonatomic) IBInspectable NSInteger selectedIndex;
@property (strong, nonatomic) IBInspectable UIColor *selectionColor;

@property (strong, nonatomic) NSArray *arraySectionTitles;

@end
