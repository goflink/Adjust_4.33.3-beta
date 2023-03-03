//
//  ADJDeeplinkBroadcast.h
//  Adjust
//
//  Created by Aditi Agrawal on 08/06/22.
//  Copyright © 2022 Adjust GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADJDeeplinkBroadcast : NSObject

/**
 * @brief Configure AEM reporting
 */
+ (void)configureDeeplinkBroadcast;

/**
 * @brief Enable AEM reporting and handle deeplink
 */
+ (void)processDeeplink:(NSURL *)deeplink;

@end
