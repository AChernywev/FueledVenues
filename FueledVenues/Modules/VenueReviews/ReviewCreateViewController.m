//
//  ReviewCreateViewController.m
//  FueledVenues
//
//  Created by Alexandr Chernyshev on 29/05/15.
//  Copyright (c) 2015 Alexandr Chernyshev. All rights reserved.
//

#import "ReviewCreateViewController.h"

#import "ServiceLayer.h"
#import "Macroses.h"
#import "ReviewsTableViewController.h"
#import "UIColor+FVColors.h"
#import "UIFont+FVFonts.h"

@interface ReviewCreateViewController ()
@property (nonatomic, weak) IBOutlet UINavigationItem *customItem;
@property (nonatomic, weak) IBOutlet UITextView *textView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *textViewBottomConstraint;

@property (nonatomic, strong) Review *review;

@end

@implementation ReviewCreateViewController

#pragma mark - Actions
- (IBAction)done:(id)sender
{
    if ([[self.textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return;
    }
    __weak typeof(self)weakSelf = self;
    [[ServiceLayer sharedDataProvider].venueService createReviewWithVenueIdentifier:self.venueIdentifier text:self.textView.text completion:^(Review *review, NSError *error) {
        if(error) {
            ShowError(error);
        }
        else {
            weakSelf.review = review;
            [weakSelf performSegueWithIdentifier:@"DismissSegue" sender:weakSelf];
        }
    }];
}

#pragma mark - lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor viewBackgroundColor];
    self.textView.font = [UIFont textFont];
    self.textView.tintColor = [UIColor darkBackgroundColor];
    self.textView.textColor = [UIColor grayTextColor];
    self.customItem.title = LOC(@"reviewcreatecontroller.title");
    self.customItem.leftBarButtonItem.title = LOC(@"reviewcreatecontroller.canceltitle");
    self.customItem.rightBarButtonItem.title = LOC(@"reviewcreatecontroller.donetitle");
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
    [self.textView becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.textView resignFirstResponder];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - working methods
- (void)keyboardShow:(NSNotification *)notification
{
    NSTimeInterval duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect frame = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    frame = [self.view.window convertRect:frame toView:self.view];
    self.textViewBottomConstraint.constant = frame.size.height;
    UIViewAnimationOptions curveOptions = [[notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] unsignedIntegerValue] << 16;
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionLayoutSubviews | curveOptions
                     animations:^{
                         [self.view layoutIfNeeded];
                     }
                     completion:nil
     ];
}

- (void)keyboardHide:(NSNotification *)notification
{
    NSTimeInterval duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    self.textViewBottomConstraint.constant = 0;
    UIViewAnimationOptions curveOptions = [[notification.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] unsignedIntegerValue] << 16;
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionLayoutSubviews | curveOptions
                     animations:^{
                         [self.view layoutIfNeeded];
                     }
                     completion:nil
     ];
}

#pragma mark - UIViewController methods
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - Segues transitions
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if(self.review && [segue.destinationViewController isKindOfClass:[ReviewsTableViewController class]]) {
        ReviewsTableViewController *reviewsController = (ReviewsTableViewController *)segue.destinationViewController;
        [reviewsController addReview:self.review];
    }
}
@end
