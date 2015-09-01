//
//  EntryReader.m
//  BillingTool
//
//  Created by Sameer Agarwal on 01/09/15.
//  Copyright (c) 2015 iOSRookie. All rights reserved.
//

#import "EntryReader.h"
#import "ProductDetails.h"
#import "TaxCalculator.h"

@interface EntryReader () {
    NSMutableArray *products;
    CGFloat totalBill;
    CGFloat grossBill;
    CGFloat totalTaxes;
}

@end

@implementation EntryReader

-(instancetype)init {
    if (self = [super init]) {
        products = [NSMutableArray array];
        totalBill = 0.0;
        grossBill = 0.0;
        totalTaxes = 0.0;
    }
    return self;
}

-(void)makeNewEntry:(NSString *)entry {
    
    ProductDetails *newProduct = [ProductDetails new];
    NSMutableArray *chunks = [[entry componentsSeparatedByString:@" "] mutableCopy];
    newProduct.quantity = [[chunks firstObject] integerValue];
    newProduct.price = [[chunks lastObject] floatValue];
    [chunks removeObjectAtIndex:0];
    [chunks removeLastObject];
    [chunks removeLastObject];
    newProduct.productName = [[chunks valueForKey:@"description"] componentsJoinedByString:@" "];
    newProduct.tax = 0.0;
    
    newProduct.tax = [TaxCalculator taxForProduct:newProduct];
    [products addObject:newProduct];
    totalBill += (newProduct.quantity * newProduct.price);
    totalTaxes += (newProduct.tax);
}

-(void)getFinalBillDetails {
    NSLog(@"Bill Generated!");
    NSLog(@"Name\t\tQuantity\tPrice (incl. taxes)");
    for (ProductDetails *thisProduct in products) {
        NSLog(@"%@\t\t%li\t%f", thisProduct.productName, (long)thisProduct.quantity, ((thisProduct.quantity * thisProduct.price) + thisProduct.tax));
    }
    NSLog(@"Total Bill Amount:\t%.02f", (totalBill + totalTaxes));
    NSLog(@"Total Taxes Paid:\t%.02f", totalTaxes);
}

@end
