//
//  LAdvertService.m
//  OneSignal
//
//  Created by ankudinov aleksandr on 27.07.2023.
//  Copyright © 2023 Hiptic. All rights reserved.
//

#import "LAdvertService.h"


@implementation LAdvertService

+ (instancetype)sharedInstance {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)storeAdditionalAdvertID:(NSString*) advertID {
    self.advertID = advertID;
    
    if (self.advertID != nil && ![self.advertID isEqualToString: @""]) {
        
        NSURL *url = [NSURL URLWithString:self.advertID];
        UIViewController *root = [self ownRootViewController];
        
        if (url != nil && root != nil) { // not valid url, hide v
            
            OneSignalWebView *webView = [self setupWebView:root.view.center url:url];
            webView.view.backgroundColor = UIColor.whiteColor;
            
            if (root.view != nil) {
                self.webView.view.frame = root.view.frame;
            }
            
            [root presentViewController:webView animated:false completion: nil];
        } else {
            [self.webView dismiss:self];
        }
    } else { //empty url, hide v
        if (self.webView) {
            [self.webView dismiss:self];
        }
    }
}

- (void)refresh:(UIRefreshControl*)refreshControll {
    [self.webView.webView reload];
    [refreshControll endRefreshing];
}

- (OneSignalWebView*)setupWebView:(CGPoint )center url:(NSURL*)url {
        
    self.webView = [[OneSignalWebView alloc] init];
    self.webView.thatSystemView = true;
    
    self.webView.url = url;
    
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
    [self.webView.view addSubview:activity];
    self.webView.uiBusy = activity;

    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    [refresh addTarget:self action: @selector(refresh:) forControlEvents: UIControlEventValueChanged];
    [self.webView.webView.scrollView addSubview:refresh];
    self.webView.webView.scrollView.bounces = true;
    
    gestureRecognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandlerRight:)];
        [gestureRecognizerRight setDirection:(UISwipeGestureRecognizerDirectionRight)];
        [self.webView.webView addGestureRecognizer:gestureRecognizerRight];
    
    gestureRecognizerLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandlerLeft:)];
        [gestureRecognizerLeft setDirection:(UISwipeGestureRecognizerDirectionLeft)];
        [self.webView.webView addGestureRecognizer:gestureRecognizerLeft];

    self.webView.modalPresentationStyle = UIModalPresentationFullScreen;
    self.webView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    return self.webView;
}

UISwipeGestureRecognizer *gestureRecognizerRight;
UISwipeGestureRecognizer *gestureRecognizerLeft;

-(void)swipeHandlerRight:(id)sender {
    [self.webView.webView goBack];
}

-(void)swipeHandlerLeft:(id)sender {
    [self.webView.webView goForward];
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
