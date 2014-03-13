//
//  BNRCanvasViewController.m
//  BigNerdsPaint
//
//  Created by Hiedi Utley on 3/13/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRCanvasViewController.h"
#import "FCColorPickerViewController.h"

@interface BNRCanvasViewController () <FCColorPickerViewControllerDelegate>

@property (nonatomic, strong) UIColor *color;

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
        UISwitch *emitterSwitch=[[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 100,50)];
        UIBarButtonItem *switchBtn=[[UIBarButtonItem alloc] initWithCustomView:emitterSwitch];
        self.navigationItem.rightBarButtonItem=switchBtn;
        [emitterSwitch addTarget:self action:@selector(switchEmitter:) forControlEvents:UIControlEventValueChanged];
        
        
        UIBarButtonItem *colorPicker = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(chooseColor:)];
        
        self.navigationItem.rightBarButtonItems = @[saveBtn, redoBtn, undoBtn,switchBtn, colorPicker];
        
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
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [drawScreen.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);

}
-(void)switchEmitter:(id)sender
{
    [drawScreen switchEmitter];
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    //From DRAWPAD by Ray Wenderlich
    // Was there an error?
    if (error != NULL)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Image could not be saved.Please try again"  delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Close", nil];
        [alert show];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Image was successfully saved in photoalbum"  delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Close", nil];
        [alert show];
    }
}

-(IBAction)undoButtonClicked:(id)sender
{
    [drawScreen undoButtonClicked];
    
}

-(IBAction)redoButtonClicked:(id)sender
{
    [drawScreen redoButtonClicked];
    
}


-(IBAction)chooseColor:(id)sender {
    FCColorPickerViewController *colorPicker = [FCColorPickerViewController colorPicker];
    colorPicker.color = self.color;
    colorPicker.delegate = self;
    
    [colorPicker setModalPresentationStyle:UIModalPresentationFormSheet];
    [self presentViewController:colorPicker animated:YES completion:nil];
}

#pragma mark - FCColorPickerViewControllerDelegate Methods

-(void)colorPickerViewController:(FCColorPickerViewController *)colorPicker didSelectColor:(UIColor *)color {
    self.color = color;
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)colorPickerViewControllerDidCancel:(FCColorPickerViewController *)colorPicker {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
