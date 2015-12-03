//
//  ViewController.h
//  VisualCal
//
//  Created by frostbitespider on 15/12/2.
//  Copyright (c) 2015年 frostbitespider. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cal.h"
@interface ViewController : UIViewController{
@private short dotNum;
@private NSArray* expTable;
@private Cal* cal;
}
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UITextView *IOText;
@property (weak, nonatomic) IBOutlet UIButton *backspace;
@property (weak, nonatomic) IBOutlet UIButton *add;
@property (weak, nonatomic) IBOutlet UIButton *minus;
@property (weak, nonatomic) IBOutlet UIButton *equal;
@property (weak, nonatomic) IBOutlet UIButton *multiply;
@property (weak, nonatomic) IBOutlet UIButton *divide;
@property (weak, nonatomic) IBOutlet UIButton *dot;
@property (weak, nonatomic) IBOutlet UIButton *n0;
@property (weak, nonatomic) IBOutlet UIButton *n1;
@property (weak, nonatomic) IBOutlet UIButton *n2;
@property (weak, nonatomic) IBOutlet UIButton *n3;
@property (weak, nonatomic) IBOutlet UIButton *n4;
@property (weak, nonatomic) IBOutlet UIButton *n5;
@property (weak, nonatomic) IBOutlet UIButton *n6;
@property (weak, nonatomic) IBOutlet UIButton *n7;
@property (weak, nonatomic) IBOutlet UIButton *n8;
@property (weak, nonatomic) IBOutlet UIButton *n9;

@end

