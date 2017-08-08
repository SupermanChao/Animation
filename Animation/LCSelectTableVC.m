//
//  LCSelectTableVC.m
//  Animation
//
//  Created by 刘超 on 2017/8/7.
//  Copyright © 2017年 ogemray. All rights reserved.
//

#import "LCSelectTableVC.h"
#import "BasicAnimationVC.h"
#import "SpringAnimationVC.h"
#import "KeyframeAnimationVC.h"
#import "TransitionVC.h"

@interface LCSelectTableVC ()

@property (nonatomic, strong) NSArray *array;
@property (nonatomic, strong) NSArray *titles;

@end

@implementation LCSelectTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.titles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.array objectAtIndex:section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.titles objectAtIndex:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld: %@",indexPath.row + 1, [[self.array objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.section) {
        case 0:
        {
            BasicAnimationVC *vc = [[BasicAnimationVC alloc] init];
            vc.type = indexPath.row;
            vc.title = [[self.array objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            SpringAnimationVC *vc = [[SpringAnimationVC alloc] init];
            vc.type = indexPath.row;
            vc.title = [[self.array objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            KeyframeAnimationVC *vc = [[KeyframeAnimationVC alloc] init];
            vc.type = indexPath.row;
            vc.title = [[self.array objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {
            TransitionVC *vc = [[TransitionVC alloc] init];
            vc.type = indexPath.row;
            vc.title = [[self.array objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


- (NSArray *)array
{
    if (!_array) {
        
        NSArray *array_0 = [NSArray arrayWithObjects:@"position.x position.y",
                            @"transform.translation.x transform.translation.y",
                            @"transform.rotation.x",
                            @"transform.rotation.y",
                            @"transform.rotation.z",
                            @"transform.scale",
                            @"bounds.origin.x bounds.origin.y",
                            @"bounds.size.width bounds.size.height",
                            @"cornerRadius borderWidth borderColor",
                            @"opacity",
                            @"backgroundColor",
                            @"contents",
                            @"shadowOffset",
                            @"shadowColor",
                            @"shadowOpacity",
                            @"shadowRadius", nil];
        
        NSArray *array_1 = [NSArray arrayWithObjects:@"bounds",@"position", nil];
        
        NSArray *array_2 = [NSArray arrayWithObjects:@"Rect For Position", @"Circle For Position", @"Scale", nil];
        
        NSArray *array_3 = [NSArray arrayWithObjects:@"type:Push subetype:FromRight",
                            @"type:Fade subetype:FromRight",
                            @"type:MoveIn subetype:FromRight",
                            @"type:Reveal subetype:FromRight",
                            @"type:cube subetype:FromRight",nil];
        
        _array = [NSArray arrayWithObjects:array_0, array_1, array_2, array_3, nil];
        
    }
    return _array;
}

- (NSArray *)titles
{
    if (!_titles) {
        _titles = [NSArray arrayWithObjects:@"CABasicAnimation_Type",
                   @"CASpringAnimation_Type",
                   @"CAKeyframeAnimation_Type",
                   @"CATransition_Type", nil];
    }
    return _titles;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
