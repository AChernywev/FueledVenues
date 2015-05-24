//
//  Macroses.h
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 23/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#define NavigationController(root)                      [[UINavigationController alloc]initWithRootViewController:root]

#define RGBColor(R,G,B)                                 [UIColor colorWithRed:(R)/255.0f green:(G)/255.0f blue:(B)/255.0f alpha:1.0f]
#define RGBAColor(R,G,B,A)                              [UIColor colorWithRed:(R)/255.0f green:(G)/255.0f blue:(B)/255.0f alpha:(A)]

#define LOC(key)                                        NSLocalizedString((key), @"")

#define NIL_TO_NULL(obj)                                (obj != nil) ? obj : [NSNull null]
#define NULL_TO_NIL(obj)                                ({ __typeof__ (obj) __obj = (obj); __obj == [NSNull null] ? nil : obj; })
#define JSON_TO_NUMBER(obj)                             ((NSNumber *)([NULL_TO_NIL(obj) isKindOfClass:[NSNumber class]] ? NULL_TO_NIL(obj) : nil))
#define JSON_TO_ARRAY(obj)                              ((NSArray *)([NULL_TO_NIL(obj) isKindOfClass:[NSArray class]] ? NULL_TO_NIL(obj) : nil))
#define JSON_TO_DICTIONARY(obj)                         ((NSDictionary *)([NULL_TO_NIL(obj) isKindOfClass:[NSDictionary class]] ? NULL_TO_NIL(obj) : nil))
#define JSON_TO_STRING(obj)                             ((NSString *)([NULL_TO_NIL(obj) isKindOfClass:[NSString class]] ? NULL_TO_NIL(obj) : nil))

#define JSON_TO_BOOL(obj)                               JSON_TO_NUMBER(obj).boolValue
#define JSON_TO_INT(obj)                                JSON_TO_NUMBER(obj).intValue
#define JSON_TO_INTEGER(obj)                            JSON_TO_NUMBER(obj).integerValue
#define JSON_TO_INT64(obj)                              JSON_TO_NUMBER(obj).longValue
#define JSON_TO_FLOAT(obj)                              JSON_TO_NUMBER(obj).floatValue
#define JSON_TO_DOUBLE(obj)                             JSON_TO_NUMBER(obj).doubleValue