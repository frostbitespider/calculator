//
//  ViewController.m
//  VisualCal
//
//  Created by frostbitespider on 15/12/2.
//  Copyright (c) 2015年 frostbitespider. All rights reserved.
//

#import "ViewController.h"
@interface ViewController (){

}
@end

@implementation ViewController
- (IBAction)NumberPressed:(id)sender {
    NSString* text=[self IOText].text;
    UIButton* btnNum=(UIButton*)sender;
    for(int i=0;i<10;i++){
        if (btnNum.tag == i) {
            NSString* t=[NSString stringWithFormat:@"%@%d",text,i];
            [[self IOText]setText:t];
            return;
        }
    }
    if (dotNum==0) {
        NSString* t=[NSString stringWithFormat:@"%@%c",text,'.'];
        dotNum++;
        [[self IOText]setText:t];
    }
}
- (IBAction)ExpPressed:(id)sender {
    //+ -   *   /   =
    //0 1   2   3   4
    NSString* text=[self IOText].text;
    UIButton* btnExp=(UIButton*)sender;
    dotNum=0;
    for(int i=0;i<4;i++){
        if (btnExp.tag == i) {
            NSString* t=[NSString stringWithFormat:@"%@%@",text,[expTable objectAtIndex:i]];
            [[self IOText]setText:t];
            return;
        }
    }
    if (btnExp.tag==4) {
        [cal Calculate:text];
    }

}
- (IBAction)BackPressed:(id)sender {
    NSString* text=[self IOText].text;
    if([text length]>0){
        if ([[text substringFromIndex:[text length]-1] isEqual:@"."]) {
            dotNum=0;
        }
        NSString* t=[text substringToIndex:[text length]-1];
        [[self IOText]setText:t];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    expTable=[[NSArray alloc]initWithObjects:@"+",@"-",@"*",@"/",@"=",nil];
    cal=[[Cal alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
