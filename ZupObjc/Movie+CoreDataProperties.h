//
//  Movie+CoreDataProperties.h
//  ZupObjc
//
//  Created by Matheus Pereira de Paula e Sousa on 28/03/17.
//  Copyright © 2017 Matheus Pereira de Paula e Sousa. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Movie+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Movie (CoreDataProperties)

+ (NSFetchRequest<Movie *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *title;
@property (nonatomic) int16_t year;
@property (nullable, nonatomic, copy) NSString *type;
@property (nullable, nonatomic, copy) NSString *imdbID;
@property (nullable, nonatomic, copy) NSString *released;
@property (nonatomic) int16_t runtime;
@property (nullable, nonatomic, copy) NSString *director;
@property (nullable, nonatomic, copy) NSString *writer;
@property (nullable, nonatomic, copy) NSString *actors;
@property (nullable, nonatomic, copy) NSString *plot;
@property (nullable, nonatomic, copy) NSString *country;
@property (nullable, nonatomic, copy) NSString *awards;
@property (nonatomic) float imdbRating;
@property (nonatomic) int32_t imdbVotes;
@property (nullable, nonatomic, retain) NSData *poster;

@end

NS_ASSUME_NONNULL_END
