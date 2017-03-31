//
//  ZUPMovieDAO.m
//  ZupObjc
//
//  Created by Matheus Pereira de Paula e Sousa on 31/03/17.
//  Copyright © 2017 Matheus Pereira de Paula e Sousa. All rights reserved.
//

#import "ZUPMovieDAO.h"
#import "AppDelegate.h"

@implementation ZUPMovieDAO

+ (void) saveMovie: (ZUPMovie *) movie {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // New managed object
    NSManagedObject *movieEntity = [NSEntityDescription insertNewObjectForEntityForName:@"Movie" inManagedObjectContext:context];
    [movieEntity setValue:movie.title forKey:@"title"];
    [movieEntity setValue:movie.imdbID forKey:@"imdbID"];
    [movieEntity setValue:movie.plot forKey:@"plot"];
    [movieEntity setValue:movie.year forKey:@"year"];
    [movieEntity setValue:movie.type forKey:@"type"];
    [movieEntity setValue:movie.released forKey:@"released"];
    [movieEntity setValue:movie.runtime forKey:@"runtime"];
    [movieEntity setValue:movie.director forKey:@"director"];
    [movieEntity setValue:movie.writer forKey:@"writer"];
    [movieEntity setValue:movie.actors forKey:@"actors"];
    [movieEntity setValue:movie.country forKey:@"country"];
    [movieEntity setValue:movie.awards forKey:@"awards"];
    [movieEntity setValue:movie.imdbRating forKey:@"imdbRating"];
    [movieEntity setValue:movie.imdbVotes forKey:@"imdbVotes"];
    [movieEntity setValue:movie.posterData forKey:@"poster"];

    
    NSError *error = nil;
    
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
}

+ (NSMutableArray *) fetchMovies {
    
    // Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Movie"];

    NSMutableArray *movies = [NSMutableArray new];
    
    for (NSManagedObject *object in [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy]) {
        
        ZUPMovie *movie = [ZUPMovie new];
        
        movie.title = [object valueForKey:@"title"];
        movie.imdbID = [object valueForKey:@"imdbID"];
        movie.plot = [object valueForKey:@"plot"];
        movie.year = [object valueForKey:@"year"];
        movie.type = [object valueForKey:@"type"];
        movie.released = [object valueForKey:@"released"];
        movie.runtime = [object valueForKey:@"runtime"];
        movie.director = [object valueForKey:@"director"];
        movie.writer = [object valueForKey:@"writer"];
        movie.actors = [object valueForKey:@"actors"];
        movie.country = [object valueForKey:@"country"];
        movie.awards = [object valueForKey:@"awards"];
        movie.imdbRating = [object valueForKey:@"imdbRating"];
        movie.imdbVotes = [object valueForKey:@"imdbVotes"];
        movie.posterData = [object valueForKey:@"poster"];

        [movies addObject:movie];
        
    }

    return movies;
}

+ (void) deleteMovie: (NSString *) imdbID {
    
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Movie"];
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"imdbID == %@", imdbID]];
    
    NSArray *fetchResult = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    for (NSManagedObject *object in fetchResult) {
        [managedObjectContext deleteObject:object];
    }
    
}

+ (BOOL) isMovieSaved: (NSString *) imdbID {
    
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Movie"];
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"imdbID == %@", imdbID]];
    
    NSArray *fetchResult = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    if ([fetchResult count] > 0) {
        return YES;
    }
    
    return NO;
}

+ (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate persistentContainer].viewContext) {
        context = [delegate persistentContainer].viewContext;
    }
    return context;
}
@end
