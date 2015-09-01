//
//  BillingHandler.m
//  BillingTool
//
//  Created by Sameer Agarwal on 01/09/15.
//  Copyright (c) 2015 iOSRookie. All rights reserved.
//

#import "BillingHandler.h"
#import "EntryReader.h"

@implementation BillingHandler

+(void)initiateBilling {
    EntryReader *entryReader = [[EntryReader alloc] init];
    
    NSLog(@"Hello! Please start entering your products in the format '<quantity> <product name> at <cost price>'. Enter 0 to get total bill and exit.");
    
    while (1) {
        char *newEntry = NULL;
        size_t len = 0;
        getline(&newEntry, &len, stdin);
        
        if (newEntry) {
            NSString *entry = [[[NSString stringWithUTF8String:newEntry] componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] componentsJoinedByString:@""];
            if (![entry isEqualToString:@"0"]) {
                [entryReader makeNewEntry:entry];
            }
            else {
                [entryReader getFinalBillDetails];
                break;
            }
        }
        else {
            [entryReader getFinalBillDetails];
            break;
        }
    }
}

@end
