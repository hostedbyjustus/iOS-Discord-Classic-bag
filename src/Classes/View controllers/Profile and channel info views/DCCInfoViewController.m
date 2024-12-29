//
//  DCCInfoViewController.m
//  Discord Classic
//
//  Created by XML on 12/11/23.
//  Copyright (c) 2023 bag.xml. All rights reserved.
//

#import "DCCInfoViewController.h"

@interface DCCInfoViewController ()

@end

@implementation DCCInfoViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return DCServerCommunicator.sharedInstance.selectedChannel.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *userIndex = [DCServerCommunicator.sharedInstance.selectedChannel.users objectAtIndex:indexPath.row];
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"hackyMode"] == NO) {
        DCRecipientTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Members cell"];
        
        
        
        
        if([userIndex valueForKey:@"avatar"] == nil) {
            cell.userPFP.image = [UIImage imageNamed:@"defaultAvatar1"];
        } else {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://cdn.discordapp.com/avatars/%@/%@.png?size=80", [userIndex valueForKey:@"snowflake"], [userIndex valueForKey:@"avatar"]]];
                NSData *data = [NSData dataWithContentsOfURL:url];
                dispatch_async(dispatch_get_main_queue(), ^{
                    cell.userPFP.image = [UIImage imageWithData:data];
                });
            });
        }
        
        id username = [userIndex valueForKey:@"username"];
        if ([username isKindOfClass:[NSString class]]) {
            cell.userName.text = (NSString *)username;
        } else {
            cell.userName.text = @"Deleted User";
            cell.userPFP.image = [UIImage imageNamed:@"defaultAvatar1"];
        }
        
        cell.userPFP.layer.cornerRadius = cell.userPFP.frame.size.width / 2.0;
        cell.userPFP.layer.masksToBounds = YES;
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Members Cell"];
        if (!cell) cell = UITableViewCell.new;
        // Configure the cell...
        cell.textLabel.text = [userIndex valueForKey:@"handle"];
        return cell;
    }
    return nil;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
}
@end
