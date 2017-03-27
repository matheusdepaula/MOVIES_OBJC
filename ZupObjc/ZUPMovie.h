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
@property (nonatomic) NSInteger *year;
@property (nonatomic) NSString *imdbID;
@property (nonatomic) NSString *type;
@property (nonatomic) NSString *released;
@property (nonatomic) NSInteger *runtime;
@property (nonatomic) NSString *director;
@property (nonatomic) NSString *writer;
@property (nonatomic) NSString *actors;
@property (nonatomic) NSString *country;
@property (nonatomic) NSString *awards;
@property (nonatomic) float *imdbRatting;
@property (nonatomic) NSInteger *imdbVotes;
@property (nonatomic) NSString *urlImage;

@end
