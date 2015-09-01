//
//  main.m
//  BillingTool
//
//  Created by Sameer Agarwal on 01/09/15.
//  Copyright (c) 2015 iOSRookie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BillingHandler.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [BillingHandler initiateBilling];
    }
    return 0;
}
