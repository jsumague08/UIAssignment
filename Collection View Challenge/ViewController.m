//
//  ViewController.m
//  Collection View Challenge
//
//  Created by OPSolutions on 05/11/2019.
//  Copyright © 2019 OPSolutions. All rights reserved.
//

#import "ViewController.h"
#import "Cell/TopMoviesCollectionViewCell.h"
#import "Cell/ShowingMoviesCollectionViewCell.h"

@interface ViewController ()

@property (strong, nonatomic) NSArray *topMovies;
@property (strong, nonatomic) NSArray *showingMovies;
@property (weak, nonatomic) IBOutlet UICollectionView *topMovieCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *showingMovieCollectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setMovieData];
    [self registerNibs];
    [self.topMovieCollectionView reloadData];
}

- (void)registerNibs {
    [self.topMovieCollectionView registerNib:[UINib nibWithNibName:@"TopMoviesCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"TopMovieCell"];
    [self.showingMovieCollectionView registerNib:[UINib nibWithNibName:@"ShowingMoviesCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ShowingMovieCell"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    if ([collectionView isEqual:self.topMovieCollectionView]) {
        NSLog(@"number of rows%ld", self.topMovies.count);
        return self.topMovies.count;
    }
    else {
        NSLog(@"number of rows %ld", self.showingMovies.count);
        return self.showingMovies.count;;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *dictionary;
    
    if ([collectionView isEqual:self.topMovieCollectionView]) {
        TopMoviesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TopMovieCell" forIndexPath:indexPath];
        
        dictionary = [self.topMovies objectAtIndex:indexPath.row];
        cell.movieTitleLabel.text = dictionary[@"title"];
        cell.movieImage.image = [UIImage imageNamed:dictionary[@"photo"]];
        
        return cell;
    }
    else {
        ShowingMoviesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ShowingMovieCell" forIndexPath:indexPath];
        
        dictionary = [self.showingMovies objectAtIndex:indexPath.row];
        cell.movieTitleLabel.text = dictionary[@"title"];
        cell.movieImage.image = [UIImage imageNamed:dictionary[@"photo"]];
        
        return cell;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
   
    if ([collectionView isEqual:self.topMovieCollectionView]) {
        CGRect screenBound = [[UIScreen mainScreen] bounds];
        CGSize screenSize = screenBound.size;
        CGFloat computedWidth = screenSize.width / 2;
    
        return CGSizeMake(computedWidth, 180);
    }
    else {
        CGRect screenBound = [[UIScreen mainScreen] bounds];
        CGSize screenSize = screenBound.size;
        CGFloat computedHeight = screenSize.height / 2;
        CGFloat computedWidth = screenSize.width / 2;
        
        return CGSizeMake(computedWidth, computedHeight);
    }
}

- (void)setMovieData {
    self.topMovies = @[@{@"photo" : @"img_avengers", @"title" : @"Avengers: Endgame"},
                       @{@"photo" : @"img_toystory", @"title" : @"Toy Story 4"},
                       @{@"photo" : @"img_onceuponatimeinhollywood", @"title" : @"Once Upon A Time"},
                       @{@"photo" : @"img_joker", @"title" : @"Joker"},
                       @{@"photo" : @"img_booksmart", @"title" : @"Booksmart"},
                       @{@"photo" : @"img_captainmarvel", @"title" : @"Captain Marvel"},
                       @{@"photo" : @"img_midsommar", @"title" : @"Midsommar"},
                       @{@"photo" : @"img_thelionking", @"title" : @"The Lion King"},
                       @{@"photo" : @"img_johnwick", @"title" : @"John Wick"},
                       @{@"photo" : @"img_rocketman", @"title" : @"Rocketman"},];
    
    self.showingMovies = @[@{@"photo" : @"img_parasite", @"title" : @"Parasite"},
                           @{@"photo" : @"img_adastra", @"title" : @"Ad Astra"},
                           @{@"photo" : @"img_spiderman", @"title" : @"Spiderman: Far From Home"},
                           @{@"photo" : @"img_it", @"title" : @"IT: Chapter 2"},
                           @{@"photo" : @"img_starwars", @"title" : @"Starwars: Rise of Skywalker"},
                           @{@"photo" : @"img_terminator", @"title" : @"Terminator: Dark Fate"},
                           @{@"photo" : @"img_zombieland", @"title" : @"Zombie Land: Double Tap"},
                           @{@"photo" : @"img_maleficent", @"title" : @"Maleficent: Mistress of Evil"},
                           @{@"photo" : @"img_theirishman", @"title" : @"The Irishman"},
                           @{@"photo" : @"img_alita", @"title" : @"Alita: Battle Angel"},
                           @{@"photo" : @"img_aladdin", @"title" : @"Aladdin"},
                           @{@"photo" : @"img_thefarewell", @"title" : @"The Farewell"}];
}

@end
