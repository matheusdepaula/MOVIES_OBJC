//
//  ZUPMyMoviesController.m
//  ZupObjc
//
//  Created by Matheus Pereira de Paula e Sousa on 31/03/17.
//  Copyright © 2017 Matheus Pereira de Paula e Sousa. All rights reserved.
//

#import "ZUPMyMoviesController.h"
#import "ZUPMovie.h"
#import "ZUPMovieDAO.h"
#import "ZUPMoviesCell.h"
#import "ZUPMovieDetailsController.h"

@interface ZUPMyMoviesController ()

@property (nonatomic) NSMutableArray<ZUPMovie*> *movies;

@end

@implementation ZUPMyMoviesController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self reloadData];
}

- (void)reloadData {
    [self getLocalMovies];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.movies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZUPMoviesCell *cell = [ZUPMoviesCell new];
    
    ZUPMovie *actualMovie = [self.movies objectAtIndex:indexPath.row];

    cell.movieName.text = [NSString stringWithFormat:@"%@ (%ld)", actualMovie.title, [actualMovie.year integerValue]];
    
    cell.moviePoster.image = [UIImage imageWithData:actualMovie.posterData];
    
    return cell;

}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [ZUPMovieDAO deleteMovie:[self.movies objectAtIndex:indexPath.row].imdbID];
        [self reloadData];
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 1.0;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"movieDetails" sender:indexPath];
    
}

#pragma mark - Coredata Services

- (void) getLocalMovies {
    self.movies = [ZUPMovieDAO fetchMovies];
}

#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString: @"movieDetails"]) {
        
        ZUPMovieDetailsController *vc = segue.destinationViewController;
        
        NSIndexPath *indexSelected = sender;
        NSString *imdbID = [self.movies objectAtIndex:indexSelected.row].imdbID;
        
        vc.imdbID = imdbID;
        vc.moviePoster = [UIImage imageWithData:[self.movies objectAtIndex:indexSelected.row].posterData];
        vc.movieTitle = [self.movies objectAtIndex:indexSelected.row].title;
        
    }
    
}

@end
