//
//  ZUPMovie.m
//  ZupObjc
//
//  Created by Matheus Pereira de Paula e Sousa on 27/03/17.
//  Copyright © 2017 Matheus Pereira de Paula e Sousa. All rights reserved.
//

#import "ZUPMovie.h"

@implementation ZUPMovie

+ (JSONKeyMapper *) keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"title": @"Title",
                                                                  @"year": @"Year",
                                                                  @"type": @"Type",
                                                                  @"released": @"Released",
                                                                  @"runtime": @"Runtime",
                                                                  @"director": @"Director",
                                                                  @"writer": @"Writer",
                                                                  @"actors": @"Actors",
                                                                  @"country": @"Country",
                                                                  @"awards": @"Awards",
                                                                  @"poster": @"Poster"
                                                                  }];
}

@end
