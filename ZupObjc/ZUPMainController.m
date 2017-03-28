//
//  ZUPMainController.m
//  ZupObjc
//
//  Created by Matheus Pereira de Paula e Sousa on 27/03/17.
//  Copyright © 2017 Matheus Pereira de Paula e Sousa. All rights reserved.
//

#import "ZUPMainController.h"
#import <AFNetworking/AFNetworking.h>
#import "ZUPMoviesCell.h"
#import "ZUPMovie.h"
#import "ZUPMovieBusinessService.h"
#import "ZUPMovieDetailsController.h"

@interface ZUPMainController ()

@property (nonatomic) NSMutableArray<ZUPMovie*> *movies;
@property (nonatomic) NSMutableArray *moviesCells;
@property (nonatomic) NSMutableDictionary <NSString*, UIImage *> *movieImages;

@end

@implementation ZUPMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchBar.delegate = self;

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
    return [self.moviesCells objectAtIndex:indexPath.row];
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

#pragma mark - Movie Cells 

- (void) getMoviesCells {
    
    self.moviesCells = [NSMutableArray new];
    self.movieImages = [NSMutableDictionary new];
    
    for (ZUPMovie *actualMovie in self.movies) {
        
        ZUPMoviesCell *cell = [ZUPMoviesCell new];
    
        cell.movieName.text = [NSString stringWithFormat:@"%@ (%ld)", actualMovie.title, [actualMovie.year integerValue]];
        
        UIActivityIndicatorView *progressIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleGray];
        
        [progressIndicator startAnimating];
        progressIndicator.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        progressIndicator.frame = cell.moviePoster.frame;
        
        [cell.moviePoster addSubview:progressIndicator];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:actualMovie.poster]]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [cell.moviePoster setImage: image];
                [self.movieImages setObject:image forKey:actualMovie.imdbID];
                [progressIndicator stopAnimating];
                
            });
            
        });
        
        [self.moviesCells addObject:cell];
    }
    
    [self.tableView reloadData];
}

#pragma mark - Search Bar Delegate

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    searchBar.text = @"";
    [self.view endEditing:YES];

}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [self.view endEditing:YES];
    NSString *textToSearch = [searchBar.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    [ZUPMovieBusinessService getMovieWithTitle:textToSearch callback:^(NSString *error, NSMutableArray *response) {
        
        if (!error) {
            
            self.movies = [[NSMutableArray alloc] initWithArray:response];
            [self getMoviesCells];
        
        } else {
            
            UIAlertController *alertError = [UIAlertController alertControllerWithTitle:@"Erro" message:error preferredStyle:UIAlertControllerStyleAlert];
            [self presentViewController:alertError animated:YES completion:nil];
            
        }
    }];
    
}

#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString: @"movieDetails"]) {
        
        ZUPMovieDetailsController *vc = segue.destinationViewController;
        
        NSIndexPath *indexSelected = sender;
        NSString *imdbID = [self.movies objectAtIndex:indexSelected.row].imdbID;
        
        vc.imdbID = imdbID;
        vc.moviePoster = [self.movieImages objectForKey:imdbID];
        vc.movieTitle = [self.movies objectAtIndex:indexSelected.row].title;
        
    }
    
}

@end
