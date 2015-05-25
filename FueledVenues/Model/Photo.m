//
//  Photo.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 25/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (NSURL *)urlWithSize:(CGSize)size
{
    CGFloat scale = [UIScreen mainScreen].scale;
    size = CGSizeApplyAffineTransform(size, CGAffineTransformMakeScale(scale, scale));
    NSString *sizeFormatString = [NSString stringWithFormat:@"%.0fx%.0f",size.width, size.height];
    NSString *photoUrlString = [NSString stringWithFormat:@"%@%@%@", self.prefix, sizeFormatString, self.suffix];
    return [NSURL URLWithString:photoUrlString];
}
@end
