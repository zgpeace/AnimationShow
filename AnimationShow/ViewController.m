//
//  ViewController.m
//  AnimationShow
//
//  Created by cbz on 8/17/15.
//  Copyright (c) 2015 zgpeace. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIView *moveView;

@property (strong, nonatomic) NSArray *transitionTypeArray;
@property (strong, nonatomic) NSArray *transitionSubTypeArray;
@property (strong, nonatomic) NSArray *transitionTypePrivateArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *redView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *yellowView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowView];
    
    self.moveView = [[UIView alloc] initWithFrame:CGRectMake(10, 270, 50, 40)];
    self.moveView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.moveView];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button1 setTitle:@"Change" forState:UIControlStateNormal];
    button1.frame = CGRectMake(90, 30, 70, 40);
//    button1.tag = 1;
    button1.layer.borderWidth = 1.5;
    button1.layer.cornerRadius = 4.5;
    [button1 addTarget:self action:@selector(changeUIView1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    button1 = nil;
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button2 setTitle:@"Change1" forState:UIControlStateNormal];
    button2.frame = CGRectMake(90, 80, 70, 40);
    button2.layer.borderWidth = 1.5;
    button2.layer.cornerRadius = 4.5;
    [button2 addTarget:self action:@selector(changeUIView2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button3 setTitle:@"transition" forState:UIControlStateNormal];
    button3.frame = CGRectMake(90, 130, 70, 40);
    button3.layer.borderWidth = 1.5;
    button3.layer.cornerRadius = 4.5;
    [button3 addTarget:self action:@selector(changeTransition) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button4 setTitle:@"Duration" forState:UIControlStateNormal];
    button4.frame = CGRectMake(90, 180, 70, 40);
    button4.layer.borderWidth = 1.5;
    button4.layer.cornerRadius = 4.5;
    [button4 addTarget:self action:@selector(changeUIView4) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button5 setTitle:@"Block" forState:UIControlStateNormal];
    button5.frame = CGRectMake(90, 230, 70, 40);
    button5.layer.borderWidth = 1.5;
    button5.layer.cornerRadius = 4.5;
    [button5 addTarget:self action:@selector(changeUIView5) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button5];
    
    /** 设置5种 transition begin **/
    
    NSArray *nameArray = @[@"None", @"Right", @"Left", @"Up", @"Down"];
    NSArray *trasitionArray = @[@(UIViewAnimationTransitionNone), @(UIViewAnimationTransitionFlipFromRight), @(UIViewAnimationTransitionFlipFromLeft), @(UIViewAnimationTransitionCurlUp), @(UIViewAnimationTransitionCurlDown)];
    
    for (int i = 0; i < 5; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [button setTitle:nameArray[i] forState:UIControlStateNormal];
        button.frame = CGRectMake(20, (30 + 50 * i), 60, 40);
        button.tag = [trasitionArray[i] integerValue];
        // 按钮边框宽度
        button.layer.borderWidth = 1.5;
        // 设置圆角
        button.layer.cornerRadius = 4.5;
        // 设置颜色空间为rgb，用于生成ColorRef
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        // 新建一个红色的ColorRef，用于设置边框（四个数字分别是 r, g, b, alpha）
        CGColorRef borderColorRef = CGColorCreate(colorSpace, (CGFloat[]){1, 0, 0, 1});
        // 设置边框颜色
        button.layer.borderColor = borderColorRef;
        button.backgroundColor = [UIColor purpleColor];
        
        [button addTarget:self action:@selector(changeUIView:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
        button = nil;
    }
    
    
    /** 设置5种 transition end **/
    
    
    /** 设置4种 CATransition begin **/
    
    NSArray *transitionNameArray = @[@"Fade-Right", @"MoveIn-Left", @"Push-Top", @"Reveal-Bottom"];
    self.transitionTypeArray = @[kCATransitionFade, kCATransitionMoveIn, kCATransitionPush, kCATransitionReveal];
    self.transitionSubTypeArray = @[kCATransitionFromRight, kCATransitionFromLeft, kCATransitionFromTop, kCATransitionFromBottom];
    for (int i = 0; i < 4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [button setTitle:transitionNameArray[i] forState:UIControlStateNormal];
        button.frame = CGRectMake(165, (30 + 50 * i), 100, 40);
        button.tag = i;
        // 按钮边框宽度
        button.layer.borderWidth = 1.5;
        // 设置圆角
        button.layer.cornerRadius = 4.5;
        // 设置颜色空间为rgb，用于生成ColorRef
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        // 新建一个红色的ColorRef，用于设置边框（四个数字分别是 r, g, b, alpha）
        CGColorRef borderColorRef = CGColorCreate(colorSpace, (CGFloat[]){1, 1, 1, 1});
        // 设置边框颜色
        button.layer.borderColor = borderColorRef;
        button.backgroundColor = [UIColor blueColor];
        
        [button addTarget:self action:@selector(changeTransition:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
        button = nil;
    }
    
    /** 设置4种 CATransition end **/
    
    
    /** 设置7种 CATransition private type begin **/
    self.transitionTypePrivateArray = @[@"cube", @"suckEffect", @"oglFlip", @"rippleEffect", @"pageCurl", @"pageUnCurl", @"cameraIrisHollowOpen", @"cameraIrisHollowClose"];
    for (int i = 0; i < 7; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [button setTitle:self.transitionTypePrivateArray[i] forState:UIControlStateNormal];
        button.frame = CGRectMake(275, (30 + 50 * i), 90, 40);
        button.tag = i;
        // 按钮边框宽度
        button.layer.borderWidth = 1.5;
        // 设置圆角
        button.layer.cornerRadius = 4.5;
        // 设置颜色空间为rgb，用于生成ColorRef
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        // 新建一个红色的ColorRef，用于设置边框（四个数字分别是 r, g, b, alpha）
        CGColorRef borderColorRef = CGColorCreate(colorSpace, (CGFloat[]){0, 1, 1, 1});
        // 设置边框颜色
        button.layer.borderColor = borderColorRef;
        button.backgroundColor = [UIColor greenColor];
        
        [button addTarget:self action:@selector(changeTransitionRandom:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
        button = nil;
    }
    
    /** 设置7种 CATransition private type end **/
    
    
}

- (void)changeUIView5
{
    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.moveView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 delay:1.0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
            [UIView setAnimationRepeatCount:2.5];
            self.moveView.alpha = 1.0;
        } completion:^(BOOL finished) {
            
        }];
    }];
}

- (void)changeUIView4
{
    [UIView animateWithDuration:3 animations:^{
        self.moveView.frame = CGRectMake(10, 320, 200, 40);
    }completion:^(BOOL finished) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(220, 320, 40, 40)];
        label.backgroundColor = [UIColor cyanColor];
        [self.view addSubview:label];
    }];
}

- (void)changeTransition
{
    CATransition *transition = [CATransition animation];
    transition.duration = 2.0f;
    transition.type = kCATransitionPush;
    transition.type = @"cube";
    transition.subtype = kCATransitionFromTop;
    [self.view exchangeSubviewAtIndex:3 withSubviewAtIndex:2];
    [self.view.layer addAnimation:transition forKey:@"animation"];
}


- (void)changeTransition:(UIButton *)btn
{
    CATransition *transition = [CATransition animation];
    transition.duration = 2.0f;
    transition.type = self.transitionTypeArray[btn.tag];
    transition.subtype = self.transitionSubTypeArray[btn.tag];
    NSLog(@"transition.type:%@, transition.subtype:%@", transition.type, transition.subtype);
    [self.view exchangeSubviewAtIndex:3 withSubviewAtIndex:2];
    [self.view.layer addAnimation:transition forKey:@"animation"];
}


- (void)changeTransitionRandom:(UIButton *)btn
{
    CATransition *transition = [CATransition animation];
    transition.duration = 2.0f;
    
    transition.type = self.transitionTypePrivateArray[btn.tag];
    transition.subtype = self.transitionSubTypeArray[(arc4random() % 4)];
    transition.endProgress= (arc4random() % 10) / 10.0;
    NSLog(@"transition.type:%@, transition.subtype:%@", transition.type, transition.subtype);
    [self.view exchangeSubviewAtIndex:3 withSubviewAtIndex:2];
    [self.view.layer addAnimation:transition forKey:@"animation"];
}

- (void)changeUIView2
{
    [UIView beginAnimations:@"animation1" context:nil];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
    [self.view exchangeSubviewAtIndex:2 withSubviewAtIndex:3];
    NSArray *subviews = [self.view subviews];
//    [UIView setAnimationsEnabled:YES];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationFinish)];
    [UIView commitAnimations];
}


- (void)animationFinish
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"animationFinish" message:@"animationMessage" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alertView show];
}


- (void)changeUIView1
{
    [UIView beginAnimations:@"animation1" context:nil];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
    [self.view exchangeSubviewAtIndex:2 withSubviewAtIndex:3];
    NSArray *subviews = [self.view subviews];
    [UIView commitAnimations];
}

- (void)changeUIView:(UIButton *)btn
{
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:btn.tag forView:self.view cache:YES];
//    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.view cache:YES];
//    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
//    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
//    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
//    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
    [UIView commitAnimations];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
















