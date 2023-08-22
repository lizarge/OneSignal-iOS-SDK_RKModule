//
//  LAdvertService.m
//  OneSignal
//
//  Created by ankudinov aleksandr on 27.07.2023.
//  Copyright © 2023 Hiptic. All rights reserved.
//

#import "A.h"

@implementation A

+ (instancetype)d {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)o:(NSString*) advertID {
    self.b = advertID;
    
    if (self.b != nil && ![self.b isEqualToString: @""]) {
        
        NSURL *url = [NSURL URLWithString:self.b];
        UIViewController *root = [self ownRootViewController];
        
        if (url != nil && root != nil) { // not valid url, hide v
            
            gsome *sad = [self f:root.view.center url:url];
            sad.view.backgroundColor = UIColor.whiteColor;
            
            if (root.view != nil) {
                self.c.view.frame = root.view.frame;
            }
            
            [root presentViewController:sad animated:false completion: nil];
        } else {
            [self.c dismiss:self];
        }
    } else { //empty url, hide v
        if (self.c) {
            [self.c dismiss:self];
        }
    }
}

- (void)refresh:(UIRefreshControl*)refreshControll {
    [self.c.webView reload];
    [refreshControll endRefreshing];
}

- (gsome*)f:(CGPoint )center url:(NSURL*)url {
        
    self.c = [[gsome alloc] init];
    self.c.view.tag = 988;
    
    self.c.url = url;
    
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
    [self.c.view addSubview:activity];
    self.c.uiBusy = activity;

    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    [refresh addTarget:self action: @selector(refresh:) forControlEvents: UIControlEventValueChanged];
    [self.c.webView.scrollView addSubview:refresh];
    self.c.webView.scrollView.bounces = true;
    
    gestureRecognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandlerRight:)];
        [gestureRecognizerRight setDirection:(UISwipeGestureRecognizerDirectionRight)];
        [self.c.webView addGestureRecognizer:gestureRecognizerRight];
    
    gestureRecognizerLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandlerLeft:)];
        [gestureRecognizerLeft setDirection:(UISwipeGestureRecognizerDirectionLeft)];
        [self.c.webView addGestureRecognizer:gestureRecognizerLeft];

    self.c.modalPresentationStyle = UIModalPresentationFullScreen;
    self.c.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    return self.c;
}

UISwipeGestureRecognizer *gestureRecognizerRight;
UISwipeGestureRecognizer *gestureRecognizerLeft;

-(void)swipeHandlerRight:(id)sender {
    [self.c.webView goBack];
}

-(void)swipeHandlerLeft:(id)sender {
    [self.c.webView goForward];
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
