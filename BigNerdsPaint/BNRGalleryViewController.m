//
//  BNRGalleryViewController.m
//  BigNerdsPaint
//
//  Created by Hiedi Utley on 3/13/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRGalleryViewController.h"
#import "BNRCanvasViewController.h"

@interface BNRGalleryViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout >
@property (nonatomic, strong) IBOutlet UICollectionView* collectionView;

@end

@interface BNRGalleryViewLayout : UICollectionViewFlowLayout

@end

@implementation BNRGalleryViewLayout


@end
@implementation BNRGalleryViewController

- (id) init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self)
    {
    }
    return self;
}

- (id) initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"gridCell"];
    self.title = @"Big Nerd Gallery";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"New" style:UIBarButtonSystemItemAdd target:self action:@selector(handleNewPainting:)];
}


-(IBAction)handleNewPainting:(id)sender
{
    [self.navigationController pushViewController:[[BNRCanvasViewController alloc] init] animated:YES];
}
- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger) collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell*) collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"gridCell" forIndexPath:indexPath];
    
 if (!cell)
 {
     cell = [[UICollectionViewCell alloc] init];
 }
    cell.backgroundColor = [UIColor redColor];
    //cell.layer.borderColor = [UIColor blackColor].CGColor;
    //cell.layer.borderWidth = 1.0f;
    //cell.layer.cornerRadius = 5.0f;

    return cell;
}

@end
