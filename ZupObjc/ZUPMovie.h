//
//  ZUPMovie.h
//  ZupObjc
//
//  Created by Matheus Pereira de Paula e Sousa on 27/03/17.
//  Copyright © 2017 Matheus Pereira de Paula e Sousa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

@interface ZUPMovie : JSONModel

@property (nonatomic) NSString *title;
@property (nonatomic) NSNumber <Optional> *year;
@property (nonatomic) NSString *imdbID;
@property (nonatomic) NSString <Optional> *type;
@property (nonatomic) NSString <Optional> *released;
@property (nonatomic) NSNumber <Optional> *runtime;
@property (nonatomic) NSString <Optional> *director;
@property (nonatomic) NSString <Optional> *writer;
@property (nonatomic) NSString <Optional> *actors;
@property (nonatomic) NSString <Optional> *country;
@property (nonatomic) NSString <Optional> *awards;
@property (nonatomic) NSNumber <Optional> *imdbRatting;
@property (nonatomic) NSNumber <Optional> *imdbVotes;
@property (nonatomic) NSString <Optional> *poster;

@end
