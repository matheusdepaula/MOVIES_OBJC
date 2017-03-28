//
//  ZUPMovieDetailsController.m
//  ZupObjc
//
//  Created by Matheus Pereira de Paula e Sousa on 28/03/17.
//  Copyright © 2017 Matheus Pereira de Paula e Sousa. All rights reserved.
//

#import "ZUPMovieDetailsController.h"
#import "ZUPMovieDetailsCell.h"
#import "ZUPMovieImageCell.h"
#import "ZUPMovieBusinessService.h"
#import "ZUPMovie.h"

@interface ZUPMovieDetailsController ()

@property (nonatomic) ZUPMovie *movie;

@end

@implementation ZUPMovieDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.movieTitle;
    [self getActualMovie];
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
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 250.0;
    }
    return 200.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 1.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0: {
            
            ZUPMovieImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell"];
            cell.moviePoster.image = self.moviePoster;
            
            return cell;
            
        }
            break;
            
        default: {
            
            ZUPMovieDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailsCell"];
            cell.txtView.text = self.movie.plot;
            
            return cell;
            
        }
            break;
    }
    
}

#pragma mark - Service Call

- (void) getActualMovie {
    
    [ZUPMovieBusinessService getMovieDetailWithID:self.imdbID callback:^(NSString *error, ZUPMovie *response) {
        
        if (!error) {
            
            self.movie = [ZUPMovie new];
            self.movie = response;
            
            [self.tableView reloadData];
        }
        
    }];
}

@end
