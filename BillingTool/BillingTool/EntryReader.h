//
//  EntryReader.h
//  BillingTool
//
//  Created by Sameer Agarwal on 01/09/15.
//  Copyright (c) 2015 iOSRookie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EntryReader : NSObject

-(void)makeNewEntry:(NSString *)entry;
-(void)getFinalBillDetails;

@end
