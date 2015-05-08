//
//  ViewController.m
//  AutoLayoutTestProject
//
//  Created by MacPro on 08/05/2015.
//  Copyright (c) 2015 MacPro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UIView *tilesContainerView;



@property (strong, nonatomic) NSMutableArray *tilesArray;

@property (strong, nonatomic) NSLayoutConstraint *rightConstrain;



@end

@implementation ViewController


#pragma mark - ViewController Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tilesArray = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - IBAction Methods


- (IBAction)ADDbtn:(UIButton *)sender
{
    
    UIView *tileView = [self createTileView];

    [self.tilesContainerView addSubview:tileView];
    
    
    
    
    [self.tilesArray addObject:tileView];
    

    
    [self applyAutoLayoutConstraintsToView:tileView];
}

- (IBAction)RemoveBtn:(UIButton *)sender
{

    [self.view removeConstraint:self.rightConstrain];
    [[self.tilesArray lastObject] removeFromSuperview];
    [self.tilesArray removeLastObject];
    
    if([self.tilesArray count] > 0){
    self.rightConstrain = [NSLayoutConstraint constraintWithItem:[self.tilesArray lastObject] attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.tilesContainerView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-5];
   
    [self.view addConstraint:self.rightConstrain];
    }
    
}

#pragma mark - Custom Methods

- (UIView *)createTileView
{

    UIView *tile = [[UIView alloc]init];
    tile.translatesAutoresizingMaskIntoConstraints = NO;
    tile.backgroundColor = [UIColor darkGrayColor];
    return  tile;
    

}


- (void)applyAutoLayoutConstraintsToView:(UIView *)viewToAdd
{
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:viewToAdd attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.tilesContainerView attribute:NSLayoutAttributeTop multiplier:1.0 constant:5];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:viewToAdd attribute:NSLayoutAttributeBottom     relatedBy:NSLayoutRelationEqual toItem:self.tilesContainerView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-5];

    
    
    [self.view removeConstraint:self.rightConstrain];
    
    
    if([self.tilesArray count] == 1)
    {
    
        self.rightConstrain = [NSLayoutConstraint constraintWithItem:viewToAdd attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.tilesContainerView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-5];
        
        NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:viewToAdd attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.tilesContainerView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:5];
        
        
        NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:viewToAdd attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.tilesContainerView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
        
        
        [self.view addConstraints:@[top, bottom, self.rightConstrain, leading, width]];
    
    }
    else
    {
    
        UIView *lastView = self.tilesArray[self.tilesArray.count - 2];
        
        self.rightConstrain = [NSLayoutConstraint constraintWithItem:viewToAdd attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.tilesContainerView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-5];
        
        NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:viewToAdd attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:lastView attribute:NSLayoutAttributeRight multiplier:1.0 constant:5];
        
        NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:viewToAdd attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:lastView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
        
        
        
        [self.view addConstraints:@[top, bottom, self.rightConstrain, width, leading]];
        
        
    
    
    
    
    }
    
}
















@end
