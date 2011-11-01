//
//  StartUIViewController.h
//  ConfDriver
//
//  Created by Ivo Galic on 5/23/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginProtocol.h"

@interface StartUIViewController : UIViewController <UITextFieldDelegate> {
    UITextField *email;
    UITextField *password;
    UIButton *button;
    UILabel *serverMessage; // errors etc
    id <LoginProtocol> delegate;
}

@property (nonatomic,retain) IBOutlet UITextField *email;
@property (nonatomic,retain) IBOutlet UITextField *password;
@property (nonatomic,retain) IBOutlet UILabel *serverMessage;
@property (nonatomic,retain) IBOutlet     UIButton *button;
@property (nonatomic,assign) id <LoginProtocol> delegate;

-(IBAction) login:(id)sender;

@end
