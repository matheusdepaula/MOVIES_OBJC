//
//  ZUPMoviesCell.h
//  ZupObjc
//
//  Created by Matheus Pereira de Paula e Sousa on 27/03/17.
//  Copyright © 2017 Matheus Pereira de Paula e Sousa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZUPMoviesCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *movieName;
@property (weak, nonatomic) IBOutlet UIImageView *moviePoster;

@end
