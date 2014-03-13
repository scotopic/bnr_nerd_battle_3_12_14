//
//  BNRCanvasViewController.m
//  BigNerdsPaint
//
//  Created by Hiedi Utley on 3/13/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRCanvasViewController.h"

@interface BNRCanvasViewController ()

@end

@implementation BNRCanvasViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveImage:)];
        self.navigationItem.rightBarButtonItem=saveBtn;
        
        UIBarButtonItem *undoBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemUndo target:self action:@selector(undoButtonClicked:)];
        
        self.navigationItem.rightBarButtonItem=undoBtn;
        
        UIBarButtonItem *redoBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRedo target:self action:@selector(redoButtonClicked:)];
        
        self.navigationItem.rightBarButtonItems = @[saveBtn, redoBtn, undoBtn];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    drawScreen=[[MyLineDrawingView alloc]initWithFrame:CGRectMake(0, 45, 768, 1004)];
    [drawScreen setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:drawScreen];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(void)saveImage:(id)sender
{
    NSLog(@"check");
}

-(IBAction)undoButtonClicked:(id)sender
{
    [drawScreen undoButtonClicked];
    
}

-(IBAction)redoButtonClicked:(id)sender
{
    [drawScreen redoButtonClicked];
    
}


@end
