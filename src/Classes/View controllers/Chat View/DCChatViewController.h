//
//  DCChatViewController.h
//  Discord Classic
//
//  Created by bag.xml on 3/6/18.
//  Copyright (c) 2018 bag.xml. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "DCChannel.h"
#import "APLSlideMenuViewController.h"
#import "DCMessage.h"
#import "DCContactViewController.h"
@interface DCChatViewController : UIViewController <UINavigationControllerDelegate, UITextViewDelegate, UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate>
- (void)getMessages:(int)numberOfMessages beforeMessage:(DCMessage*)message;

@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UITableView *chatTableView;
@property (weak, nonatomic) IBOutlet UITextView *inputField;
@property (weak, nonatomic) IBOutlet UILabel *inputFieldPlaceholder;
@property (weak, nonatomic) IBOutlet UIImageView *insetShadow;


//buttons
@property (weak, nonatomic) IBOutlet UIBarButtonItem *memberButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sendButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *photoButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property bool viewingPresentTime;

@property DCMessage *selectedMessage;

@property NSMutableArray* messages;

@property (nonatomic, strong) UIPopoverController *imagePopoverController;


@end
