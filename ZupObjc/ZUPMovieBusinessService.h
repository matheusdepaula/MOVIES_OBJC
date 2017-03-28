//
//  ZUPMovieBusinessService.h
//  ZupObjc
//
//  Created by Matheus Pereira de Paula e Sousa on 27/03/17.
//  Copyright © 2017 Matheus Pereira de Paula e Sousa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZUPMovie.h"

@interface ZUPMovieBusinessService : NSObject

+ (void) getMovieWithTitle: (NSString *) movieTitle callback:(void (^)(NSString *error, NSMutableArray* response))callback;
+ (void) getMovieDetailWithID: (NSString *) imdbID callback:(void (^)(NSString *error, ZUPMovie* response))callback;

@end
