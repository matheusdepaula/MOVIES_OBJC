//
//  ZUPMovieDAO.h
//  ZupObjc
//
//  Created by Matheus Pereira de Paula e Sousa on 31/03/17.
//  Copyright © 2017 Matheus Pereira de Paula e Sousa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ZUPMovie.h"


@interface ZUPMovieDAO : NSObject

+ (void) saveMovie: (ZUPMovie *) movie;
+ (NSMutableArray *) fetchMovies;

@end
