//
//  Cal.m
//  OCCal
//
//  Created by frostbitespider on 15/11/25.
//  Copyright (c) 2015年 frostbitespider. All rights reserved.
//

#import "Cal.h"
//  (     )      *    +    other    -   other   /
@implementation Cal
- (id)init
{
    if( self=[super init] )
    {
        mid=[[Stack alloc]init];
        type=[[NSMutableArray alloc]init];
        suffix=[[NSMutableArray alloc]init];
        int a[]={1,1,3,2,0,2,0,3};
        for (int i=0; i<8; i++) {
            prioTable[i]=a[i];
        }
    }
    return self;
}
-(void)popmid{
    if ([mid count]<=0) {
        return;
    }
    else{
        [suffix addObject:[mid top]];
        [type addObject:[[NSNumber alloc]initWithBool:NO]];
        [mid pop];
    }
}
-(BOOL)isNum:(char)c{
    return ((c>='0'&&c<='9')||c=='.') ;
}
-(BOOL)isExp:(char) c{
    return (c=='+'||c=='-'||c=='*'||c=='/'||c=='('||c==')'||c=='=');
}
-(BOOL) compare_prio:(char)a  :(char)b {
    //两个字符先需要转换
    if (a == '='){
        a = ')';
    }else if (a == '#'){
        a = '(';
    }
    if (b == '='){
        b = ')';
    }else if (b == '#'){
        b = '(';
    }
    return (prioTable[a-40]-prioTable[b-40])>=0;
}
-(NSNumber*) Calculate:(NSString*)src {
    [self gensuffix:src];
    [mid visit];
    //[suffix visit];
    NSLog(@"suffix is %@",suffix);
    NSLog(@"type is %@",type);
    Stack* cal=[[Stack alloc]init];
    for(int i=0;i<suffix.count;i++){
        NSObject* t=[type objectAtIndex:i];
        NSObject* v=[suffix objectAtIndex:i];
        if (t==[[NSNumber alloc]initWithBool:YES]) {//v为数字
            [cal push:(NSNumber*)v];
        }
        else{//v为加减乘除
            float a=[[cal top] floatValue];
            [cal pop];
            if(cal.count==0){
                NSLog(@"ERROR WHEN CAL");
                return [[NSNumber alloc]initWithInt:-888888];
            }
            float b=[[cal top] floatValue];
            NSNumber* c=[[NSNumber alloc]init];
            [cal pop];
            char exp=[(NSString*)v cStringUsingEncoding:((NSUnicodeStringEncoding))][0];
            switch (exp) {
                case '+':
                    c=[NSNumber numberWithFloat:b+a];
                    break;
                case '-':
                    c=[NSNumber numberWithFloat:b-a];
                    break;
                case '*':
                    c=[NSNumber numberWithFloat:b*a];
                    break;
                case '/':
                    c=[NSNumber numberWithFloat:b/a];
                    break;
                default:
                    break;
            }
            [cal push:c];
        }
    }
    NSNumber* result=[cal top];
    [cal pop];
    return result;
}
-(void)gensuffix:(NSString*)src{
    /*
     * 算符的优先级表，依次是
     (     )      *    +    other    -   other   /
     40 41  42  43   44    45  46    47
     *这样使得它们与自己代表的ASCII码相对应
     */
    NSNumber* num;
    //const char* content=[src cStringUsingEncoding:NSUnicodeStringEncoding];
    const char* content=[src cStringUsingEncoding:[NSString defaultCStringEncoding]];
    NSLog(@"content is %s",content);
    short low=0;
    short high=0;
    short dotPos=0;
    BOOL dotPre=YES;//dot pre has number
    //accept 99.    9.9  .9
    for (int i=0; i<src.length;) {
        //<numberBuilder
        if([self isNum :content[i] ]){
            short dotNum=0;
            low=i;high=i;
            if(content[i]=='.'){
                if (i==0) {
                    dotPre=0;
                }
                else{
                    if (![self isNum:content[i]]) {
                        dotPre=0;
                    }
                }
            }
            dotNum=1;
            while (i<src.length) {
                if (content[i]=='.') {
                    if(dotNum==1){
                        NSLog(@"dot number >1");
                        return;
                    }
                    if(dotNum==0){
                        dotNum++;high++;dotPos=i;
                    }
                }
                else if([self isNum: content[i]]){
                    high++;
                }
                else if([self isExp:content[i]]){
                    if (i==dotPos+1) {//9.+
                        high--;
                    }
                    break;//dont add i
                }
                i++;
            }
            NSRange range=NSMakeRange(low, high-low);
            NSString* temp=[src substringWithRange:range];
            num=[NSNumber numberWithFloat:[temp floatValue]];
            //numberBuilder>
            [suffix addObject:num];
            [type addObject:[[NSNumber alloc]initWithBool:YES]];//num is YES
        }
        else if ([self isExp: content[i] ]){
            if(content[i]=='('){
                [mid push:[NSString stringWithFormat:@"%c",'(']];
            }
           else if(content[i]==')'){
               while (mid.count>0&&![mid.top isEqualToString:@"("]) {
                   [self popmid];
               }
                [mid pop];
            }
           else{//其他合法符号
               char ch=content[i];
               if(mid.count>0){
                   NSString* ta=mid.top;
                   char top=[ta cStringUsingEncoding:((NSUnicodeStringEncoding))][0];
                   if (![self compare_prio:content[i] :top]) {//比栈顶符号小
                       while (mid.count!=0&&![mid.top isEqualToString:@"("]) {
                           [self popmid];
                       }
                   }
               }
               //高于栈顶符号，直接进栈
                [mid push:[NSString stringWithFormat:@"%c",ch]];
           }
            i++;
        }
        else{
            NSLog(@"ERROR OCCURS");
            return;
        }
    }
    while(mid.count>0)
        [self popmid];
}
@end
