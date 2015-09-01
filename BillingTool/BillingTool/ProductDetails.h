//
//  ProductDetails.h
//  BillingTool
//
//  Created by Sameer Agarwal on 01/09/15.
//  Copyright (c) 2015 iOSRookie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductDetails : NSObject

@property NSInteger quantity;
@property NSString *productName;
@property CGFloat price;
@property CGFloat tax; //Taxes are really gross

@end
