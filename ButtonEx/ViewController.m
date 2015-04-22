//
//  ViewController.m
//  ButtonEx
//
//  Created by Kulyash Orazbekova on 10.03.14.
//  Copyright (c) 2014 Kulyash. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    int x, y, k, a, z,s,e;
    UIButton* button;
    UIButton* buttonForSelector;
    
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    s=0;
    button = [UIButton new];
    buttonForSelector = [UIButton new];
    z=0;
    int xa[5];
    xa[0]=7;
    for(int i=1;i<5;i++){
        xa[i]=xa[i-1]+63;
    }
    
    int ya[6];
    ya[0]=24;
    for(int i=1;i<6;i++){
        ya[i]=ya[i-1]+88;
    }
    int de[6][5];
    for(int i=0;i<6;i++){
        for(int j=0;j<5;j++)
            de[i][j]=0;
    }
    e=0;
    
    NSArray* array = [[NSArray alloc]initWithObjects:@"anna.jpg", @"el'za.png", @"kristoff.jpg", @"olov3.png", @"princ.png",@"swen.png", @"olov2.png", nil];
   
    x=7, y=24;
    int r =0;
    for (int i=0; i<3; i++) {
        for(int j=0;j<5;j++){
            k=arc4random()%7;
            int d,e;
            d=arc4random()%3;
            d+=3;
            e=arc4random()%5;
            
            if(de[d][e]!=1){
                UIImage* card = [UIImage new];
                card = [UIImage imageNamed:@"cards.jpg"];
                UIButton* b = [[UIButton alloc]initWithFrame:CGRectMake(x, y, 55, 80)];
                UIButton* c = [[UIButton alloc]initWithFrame:CGRectMake(xa[e], ya[d], 55, 80)];
                
                [b addTarget:self
                   action:@selector(myAction:)
                   forControlEvents:UIControlEventTouchUpInside];
                
                [c addTarget:self
                   action:@selector(myAction:)
                   forControlEvents:UIControlEventTouchUpInside];
    
                
               // NSLog(@"{i=%d, j=%d}, {d=%d, e=%d} %@", i,j,d,e,[array objectAtIndex:k]);
                [b setBackgroundImage:card forState:UIControlStateNormal];
                [c setBackgroundImage:card forState:UIControlStateNormal];
                card = [UIImage imageNamed:[array objectAtIndex:k]];
                if([[array objectAtIndex:k] isEqualToString:@"anna.jpg"])
                    r=1;
                if([[array objectAtIndex:k] isEqualToString:@"el'za.png"])
                    r=2;
                if([[array objectAtIndex:k] isEqualToString:@"kristoff.jpg"])
                    r=3;
                if([[array objectAtIndex:k] isEqualToString:@"olov3.png"])
                    r=4;
                if([[array objectAtIndex:k] isEqualToString:@"princ.png"])
                    r=5;
                if([[array objectAtIndex:k] isEqualToString:@"swen.png"])
                    r=6;
                if([[array objectAtIndex:k] isEqualToString:@"olov2.png"])
                    r=7;
                
                
                [b setTag:r];
                [c setTag:r];
                
                [b setBackgroundImage:card forState:UIControlStateSelected];
                [c setBackgroundImage:card forState:UIControlStateSelected];
                
                [self.view addSubview:b];
                [self.view addSubview:c];
                de[d][e]=1;
            }
            
            
            else{
                for(int q=0;q<6;q++){
                    for(int w=0;w<5;w++){
                        if(de[q][w]==0){
                            while(de[d][e]==1){
                                d=arc4random()%3;
                                d+=3;
                                e=arc4random()%5;
                            }
                            UIImage* card = [UIImage new];
                            card = [UIImage imageNamed:@"cards.jpg"];
                            UIButton* b = [[UIButton alloc]initWithFrame:CGRectMake(x, y, 55, 80)];
                            UIButton* c = [[UIButton alloc]initWithFrame:CGRectMake(xa[e], ya[d], 55, 80)];
                            if([[array objectAtIndex:k] isEqualToString:@"anna.jpg"])
                                r=1;
                            if([[array objectAtIndex:k] isEqualToString:@"el'za.png"])
                                r=2;
                            if([[array objectAtIndex:k] isEqualToString:@"kristoff.jpg"])
                                r=3;
                            if([[array objectAtIndex:k] isEqualToString:@"olov3.png"])
                                r=4;
                            if([[array objectAtIndex:k] isEqualToString:@"princ.png"])
                                r=5;
                            if([[array objectAtIndex:k] isEqualToString:@"swen.png"])
                                r=6;
                            if([[array objectAtIndex:k] isEqualToString:@"olov2.png"])
                                r=7;
                            
                            [b setTag:r];
                            [c setTag:r];
                            
                            [b addTarget:self
                               action:@selector(myAction:)
                               forControlEvents:UIControlEventTouchUpInside];
                            
                            [c addTarget:self
                               action:@selector(myAction:)
                               forControlEvents:UIControlEventTouchUpInside];
                            
                           // NSLog(@"{i=%d, j=%d}, {d=%d, e=%d} %@", i,j,d,e,[array objectAtIndex:k]);
                            [b setBackgroundImage:card forState:UIControlStateNormal];
                            [c setBackgroundImage:card forState:UIControlStateNormal];
                            card = [UIImage imageNamed:[array objectAtIndex:k]];
                            

                            [b setBackgroundImage:card forState:UIControlStateSelected];
                            [c setBackgroundImage:card forState:UIControlStateSelected];
                            
                            [self.view addSubview:b];
                            [self.view addSubview:c];
                            de[d][e]=1;
                            q=6;w=5;
                        }
                    }
                }
            
            }
            x+=63;
        }
        x=7;
        y+=88;
    }
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)myAction:(UIButton*) sender {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:sender cache:YES];
    [UIView commitAnimations];
    if(z==0){
        s=sender.tag;
        z=1;
        [sender setSelected:YES];
        button = sender;
        
    }
    
    else{
        buttonForSelector = sender;
        [sender setSelected:YES];
        if(s==sender.tag)
            [self performSelector:@selector(beforeClose) withObject:nil afterDelay:0.5];
            
        else
            [self performSelector:@selector(addCoins) withObject:nil afterDelay:0.5];

        z=0;
    }
    
    
}
-(void)addCoins {
    [button setSelected:NO];
    [buttonForSelector setSelected:NO];
}
-(void)beforeClose {
    buttonForSelector.enabled = NO;
    button.enabled = NO;
}

@end
