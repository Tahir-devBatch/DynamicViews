//
//  ViewController.m
//  AutoLayoutTestProject
//
//  Created by MacPro on 08/05/2015.
//  Copyright (c) 2015 MacPro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)ADDbtn:(UIButton *)sender;
- (IBAction)RemoveBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIView *tilesContainerView;

@end

@implementation ViewController


#pragma mark - ViewController Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - IBAction Methods


- (IBAction)ADDbtn:(UIButton *)sender
{

}

- (IBAction)RemoveBtn:(UIButton *)sender
{

}

#pragma mark - Custom Methods

- (UIView *)createTileView
{

    UIView *tile = [[UIView alloc]init];
    tile.translatesAutoresizingMaskIntoConstraints = NO;
    tile.backgroundColor = [UIColor darkGrayColor];
    return  tile;
    

}


@end
