//
//  ADJDeeplinkBroadcast.m
//  Adjust
//
//  Created by Aditi Agrawal on 08/06/22.
//  Copyright © 2022 Adjust GmbH. All rights reserved.
//

#import "ADJDeeplinkBroadcast.h"

#if __has_feature(modules)
@import FBAEMKit;
#else
#import <FBAEMKit/FBAEMKit.h>
#endif

static NSString *fbAppID;

@interface ADJDeeplinkBroadcast (){}

@end

@implementation ADJDeeplinkBroadcast

+ (void)configureDeeplinkBroadcast {
    fbAppID = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"FacebookAppID"];
    if (fbAppID && ![fbAppID isEqualToString: @""]) {
        // configure the FBAEM Kit
        [FBAEMReporter configureWithNetworker:nil appID:fbAppID reporter:nil];
    } else {
        // Abort FBAEM Kit initialization
    }
}

+ (void)processDeeplink:(NSURL *)deeplink {
    if (fbAppID && ![fbAppID isEqualToString: @""]) {
        // Enable AEM reporting and handle the deeplink
        [FBAEMReporter enable];
        [FBAEMReporter handleURL:deeplink];
    } else {
        // Abort FBAEM Kit deeplink processing
    }
}

@end
