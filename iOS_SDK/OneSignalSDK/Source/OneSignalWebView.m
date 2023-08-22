/**
 * Modified MIT License
 *
 * Copyright 2016 OneSignal
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * 1. The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * 2. All copies of substantial portions of the Software may only be used in connection
 * with services provided by OneSignal.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#import <UIKit/UIKit.h>
#import "OneSignalWebView.h"
#import "OneSignal.h"
#import "OneSignalHelper.h"
#import "A.h"


@implementation OneSignalWebView

UINavigationController *navController;
UIViewController *viewControllerForPresentation;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _webView = [WKWebView new];
    _webView.navigationDelegate = self;
    [self.view addSubview:_webView];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self pinSubviewToMarginsWithSubview:_webView withSuperview:self.view];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismiss:)];
    
    _uiBusy = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    _uiBusy.color = [UIColor blackColor];
    _uiBusy.hidesWhenStopped = YES;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_uiBusy];
    
    if (_url)
        [_webView loadRequest:[NSURLRequest requestWithURL:_url]];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog( @"%@",@"Did transition");
    
    UIDeviceOrientation deviceOrientation = [[UIDevice currentDevice] orientation];
    
    if (deviceOrientation == UIDeviceOrientationLandscapeRight || deviceOrientation == UIDeviceOrientationLandscapeLeft) {
        self.webView.frame = self.view.frame;
        self.webView.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.automaticallyAdjustsScrollViewInsets = NO;
          if (@available(iOS 11.0, *)) {
            self.webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
          }
    }
    
    if (@available(iOS 15.0, *)) {
        self.webView.scrollView.backgroundColor = [self.webView underPageBackgroundColor];
        self.view.backgroundColor = [self.webView underPageBackgroundColor];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (_url && self.view.tag != 998 ) {
        [_webView loadRequest:[NSURLRequest requestWithURL:_url]];
    }
}

- (void)dismiss:(id)sender {
    [self.navigationController dismissViewControllerAnimated:true completion:^{
        [self clearWebView];
    }];
}

-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    [_uiBusy startAnimating];
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [_webView evaluateJavaScript:@"document.title" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        self.title = result;
        self.navigationController.title = self.title;
        [_uiBusy stopAnimating];
    }];
    
    if (@available(iOS 15.0, *)) {
        self.view.backgroundColor = [webView underPageBackgroundColor];
    }
}

-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    [OneSignalLog onesignalLog:ONE_S_LL_ERROR message:[NSString stringWithFormat:@"webView: An error occurred during navigation: %@", error]];
    [_uiBusy stopAnimating];
}

- (void)pinSubviewToMarginsWithSubview:(UIView *)subview withSuperview:(UIView *)superview {
    subview.translatesAutoresizingMaskIntoConstraints = false;
    
    let attributes = @[@(NSLayoutAttributeTop), @(NSLayoutAttributeBottom), @(NSLayoutAttributeLeading), @(NSLayoutAttributeTrailing)];
    
    for (NSNumber *layoutAttribute in attributes) {
        let attribute = (NSLayoutAttribute)[layoutAttribute longValue];
        
        if ([layoutAttribute isEqualToValue: @(NSLayoutAttributeTop) ]) {
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:subview attribute:attribute relatedBy:NSLayoutRelationEqual toItem:superview attribute:attribute multiplier:1.0 constant:50.0]];
        } else {
            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:subview attribute:attribute relatedBy:NSLayoutRelationEqual toItem:superview attribute:attribute multiplier:1.0 constant:0.0]];
        }
        
    }
    
    [superview layoutIfNeeded];
}

- (void)showInApp {
    // If already presented, no need to present again
    if (!navController) {
        navController = [[UINavigationController alloc] initWithRootViewController:self];
        navController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    }
    navController.presentationController.delegate = self;

    if (!viewControllerForPresentation) {
        viewControllerForPresentation = [[UIViewController alloc] init];
        [[viewControllerForPresentation view] setBackgroundColor:[UIColor clearColor]];
        [[viewControllerForPresentation view] setOpaque:FALSE];
    }
    
    if (navController.isViewLoaded && navController.view.window) {
        // navController is visible only refresh webview
        if (_url)
            [_webView loadRequest:[NSURLRequest requestWithURL:_url]];
        return;
    }
    
    UIWindow* mainWindow = [[UIApplication sharedApplication] keyWindow];
    
    if (!viewControllerForPresentation.view.superview) {
        [mainWindow addSubview:[viewControllerForPresentation view]];
    }
    
    @try {
        [viewControllerForPresentation presentViewController:navController animated:YES completion:nil];
    }
    @catch(NSException* exception) { }
}

- (void)clearWebView {
    [_webView loadHTMLString:@"" baseURL:nil];
    if (viewControllerForPresentation) {
        [OneSignal onesignalLog:ONE_S_LL_VERBOSE message:@"clearing web view"];
        [viewControllerForPresentation.view removeFromSuperview];
    }
        
}

- (void)presentationControllerDidDismiss:(UIPresentationController *)presentationController {
    [OneSignal onesignalLog:ONE_S_LL_VERBOSE message:@"presentation controller did dismiss webview"];
    [self clearWebView];
}

@end


