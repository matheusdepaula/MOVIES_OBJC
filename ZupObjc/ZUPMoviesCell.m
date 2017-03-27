//
//  ZUPMoviesCell.m
//  ZupObjc
//
//  Created by Matheus Pereira de Paula e Sousa on 27/03/17.
//  Copyright © 2017 Matheus Pereira de Paula e Sousa. All rights reserved.
//

#import "ZUPMoviesCell.h"

@implementation ZUPMoviesCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        
        if (self) {
            self = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"ZUPMoviesCell" owner:self options:nil] firstObject];
        }
        
        return self;
    }
}

@end
