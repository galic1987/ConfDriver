//
//  StartUIViewController.m
//  ConfDriver
//
//  Created by Ivo Galic on 5/23/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import "StartUIViewController.h"



@implementation StartUIViewController

@synthesize email,password,serverMessage,delegate,button;


-(IBAction) login:(id)sender{
    // send to server 
    NSLog(@"Login with following data: email:%@ pass:%@",email.text, password.text);
    serverMessage.text = @"Contacting server...";
    [delegate login:email.text sender:self message:@"login"];
    [password resignFirstResponder];
    [email resignFirstResponder];

}

-(IBAction)editingEnded:(id)sender{
    [sender resignFirstResponder]; 
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [button release];
    [email release];
    [password release];
    [serverMessage release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [email becomeFirstResponder];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
