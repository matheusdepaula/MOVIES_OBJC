//
//  ZUPMovieBusinessService.m
//  ZupObjc
//
//  Created by Matheus Pereira de Paula e Sousa on 27/03/17.
//  Copyright © 2017 Matheus Pereira de Paula e Sousa. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "ZUPMovieBusinessService.h"

#define MOVIE_BASE_URL "http://www.omdbapi.com/?s=%@"
#define MOVIE_DETAIL_BASE_URL "http://www.omdbapi.com/?i=%@"

@implementation ZUPMovieBusinessService

+ (void) getMovieWithTitle: (NSString *) movieTitle callback:(void (^)(NSString *error, NSMutableArray* response))callback {
    NSString *urlString = [NSString stringWithFormat:@MOVIE_BASE_URL, movieTitle];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *models = [[NSArray alloc] initWithArray: [responseObject objectForKey:@"Search"]];
        NSMutableArray *movies = [NSMutableArray new];
        
        for (id data in models) {
            
            ZUPMovie *actualMovie = [[ZUPMovie alloc] initWithDictionary:data error:nil];
            [movies addObject:actualMovie];
        
        }
                
        callback (nil, movies);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        callback(error.description, nil);
        
    }];
}

+ (void) getMovieDetailWithID: (NSString *) imdbID callback:(void (^)(NSString *error, ZUPMovie* response))callback {
    
    NSString *urlString = [NSString stringWithFormat:@MOVIE_DETAIL_BASE_URL, imdbID];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        ZUPMovie *movie = [[ZUPMovie alloc] initWithDictionary:responseObject error:nil];
        
        callback (nil, movie);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        callback(error.description, nil);
        
    }];

}

@end
