//
//  TopMoviesCollectionViewCell.h
//  Collection View Challenge
//
//  Created by OPSolutions on 05/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TopMoviesCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *movieImage;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;

@end

NS_ASSUME_NONNULL_END
