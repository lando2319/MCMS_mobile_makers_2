//
//  ViewController.m
//  MCMS2
//
//  Created by MIKE LAND on 10/7/14.
//  Copyright (c) 2014 MIKE LAND. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *monsterList;

@property (weak, nonatomic) IBOutlet UITableView *monsterView;
@property (weak, nonatomic) IBOutlet UITextField *addMonsterField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MagicalCreature *bigMonster = [[MagicalCreature alloc] init];
    bigMonster.name = @"big monster";
    MagicalCreature *mediumMonster = [[MagicalCreature alloc] init];
    mediumMonster.name = @"medium monster";
    MagicalCreature *smallMonster = [[MagicalCreature alloc] init];
    smallMonster.name = @"small monster";

    NSLog(@"%@", bigMonster.name);
    NSLog(@"%@", mediumMonster.name);
    NSLog(@"%@", smallMonster.name);
    self.creatures = [NSMutableArray arrayWithObjects:bigMonster, mediumMonster, smallMonster, nil];
    NSLog(@"%@", self.creatures);


}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.creatures.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCellID" forIndexPath:indexPath];
    MagicalCreature *creatureActual = [self.creatures objectAtIndex:indexPath.row];
    cell.textLabel.text = creatureActual.name;
    return cell;
}


- (IBAction)addMonsterButton:(id)sender {
    NSLog(@"%@", self.addMonsterField.text);
    MagicalCreature *newCreature = [[MagicalCreature alloc] init];
    newCreature.name = self.addMonsterField.text;
    [self.creatures insertObject:newCreature atIndex:0];
    [self.monsterList reloadData];
    self.addMonsterField.text = @"";
    [self.view endEditing:YES];

}




@end
