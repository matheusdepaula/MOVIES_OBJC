//
//  Movie+CoreDataProperties.m
//  ZupObjc
//
//  Created by Matheus Pereira de Paula e Sousa on 28/03/17.
//  Copyright © 2017 Matheus Pereira de Paula e Sousa. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Movie+CoreDataProperties.h"

@implementation Movie (CoreDataProperties)

+ (NSFetchRequest<Movie *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Movie"];
}

@dynamic title;
@dynamic year;
@dynamic type;
@dynamic imdbID;
@dynamic released;
@dynamic runtime;
@dynamic director;
@dynamic writer;
@dynamic actors;
@dynamic plot;
@dynamic country;
@dynamic awards;
@dynamic imdbRating;
@dynamic imdbVotes;
@dynamic poster;

@end
