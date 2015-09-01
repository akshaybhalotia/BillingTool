//
//  BillCalculator.m
//  BillingTool
//
//  Created by Sameer Agarwal on 01/09/15.
//  Copyright (c) 2015 iOSRookie. All rights reserved.
//

#import "TaxCalculator.h"

@implementation TaxCalculator

+(CGFloat)taxForProduct:(ProductDetails *)myProduct {
    CGFloat tax = 0.0;
    if (![self belongsToExempted:myProduct.productName]) {
        tax += myProduct.quantity * myProduct.price * 0.1;
    }
    if ([self isImported:myProduct.productName]) {
        tax += myProduct.quantity * myProduct.price * 0.05;
    }
    tax = round(tax * 100) / 100;
    tax = round(tax * 20) / 20;
    return tax;
}

+(BOOL)belongsToExempted:(NSString *)name {
//    NSString *listPath = [[NSBundle mainBundle] pathForResource:@"Exempted" ofType:@"plist"];
//    NSArray *exemptList = [NSArray arrayWithContentsOfFile:listPath];
    NSArray *exemptList = @[@"chocolate", @"book", @"pill"];
    for (NSString *exemption in exemptList) {
        if ([name rangeOfString:exemption].location != NSNotFound) {
            return YES;
        }
    }
    return NO;
}

+(BOOL)isImported:(NSString *)name {
    if ([name rangeOfString:@"import"].location != NSNotFound) {
        return YES;
    }
    return NO;
}

@end
