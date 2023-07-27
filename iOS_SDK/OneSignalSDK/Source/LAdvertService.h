//
//  LAdvertService.h
//  OneSignal
//
//  Created by ankudinov aleksandr on 27.07.2023.
//  Copyright © 2023 Hiptic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "OneSignalWebView.h"


NS_ASSUME_NONNULL_BEGIN

//LA all logic here

@interface LAdvertService : NSObject

@property (strong, nonatomic) NSString *advertID;
@property (strong, nonatomic) OneSignalWebView *webView;

+ (instancetype)sharedInstance;
- (void)storeAdditionalAdvertID:(NSString*) advertID;

@end

NS_ASSUME_NONNULL_END

