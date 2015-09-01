//
//  BillCalculator.h
//  BillingTool
//
//  Created by Sameer Agarwal on 01/09/15.
//  Copyright (c) 2015 iOSRookie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductDetails.h"

@interface TaxCalculator : NSObject

+ (CGFloat)taxForProduct:(ProductDetails *)myProduct;

@end
