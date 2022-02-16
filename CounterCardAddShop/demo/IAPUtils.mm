//
//  IAPUtils.m
//  游艺跑得快
//
//  Created by 余泽盛 on 2019/4/25.
//

#import <Foundation/Foundation.h>
#import "IAPUtils.h"
#include <string>

#import <StoreKit/StoreKit.h>

//#import "HYIAPFramework/IAPShare.h"

//#import "IAPShare.h"
//#import "IAPHelper.h"

#include "../IAP/ApplePayTools.h"
#include "CCLuaBridge.h"

@implementation IAPUtils

+ (IAPUtils *) sharedIAPUtils {
    static IAPUtils * _sharedIAPUtils = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedIAPUtils = [[IAPUtils alloc] init];
    });
    return _sharedIAPUtils;
}

+ (Boolean) toBuyProducts:(NSDictionary *)args
{
    NSString *ids = [args objectForKey:@"product_id"];
    [ApplePayTools setLanguage:@"en"];
    [ApplePayTools iap:ids callback:^(NSString *response, NSError *error) {
        if (error == nil){
            cocos2d::LuaBridge::getStack()->executeString((std::string("G_buycallback(true, \"") + [ids UTF8String] + "\");").c_str() );
        }
        else{
           cocos2d::LuaBridge::getStack()->executeString((std::string("G_buycallback(false, \"") + [ids UTF8String] + "\");").c_str());
        }
    }];
    return true;
}

@end
