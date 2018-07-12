//
//  ViewController.m
//  SAMUF2
//
//  Created by stefono on 28/06/18.
//  Copyright (c) 2018 stefano.aru. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
NSArray * model;
NSArray * viewControllers;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //setup modello
    model = @[@"Immagine",@"calcola data", @"credits"];
    
    //setup vista
    UITableView * tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    [self.view addSubview:tableView];
    
    ImageViewController * imageVC = [[ImageViewController alloc] init];
    DataViewController * dataVC = [[DataViewController alloc] init];
    CreditsViewController * creditsVC = [[CreditsViewController alloc] init];
    
    viewControllers = @[imageVC, dataVC, creditsVC];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc] init];
    
    //prelevo la stringa dal modello e lo passo alla cella
    [cell.textLabel setText:model[indexPath.row]];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [model count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self presentViewController:viewControllers[indexPath.row]
                       animated:YES
                     completion:nil];
}

@end
