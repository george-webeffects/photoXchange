#import "CopyLabel.h"

@implementation CopyLabel

#pragma mark Initialization

- (void) attachTapHandler
{
    [self setUserInteractionEnabled:YES];
    UIGestureRecognizer *touchy = [[UITapGestureRecognizer alloc]
        initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:touchy];
    [touchy release];
}

- (id) initWithFrame: (CGRect) frame
{
    [super initWithFrame:frame];
    [self attachTapHandler];
    return self;
}

- (void) awakeFromNib
{
    [super awakeFromNib];
    [self attachTapHandler];
}

#pragma mark Clipboard

- (void) copy: (id) sender
{
    NSLog(@"Copy handler, label: “%@”.", self.text);
    UIPasteboard *pb = [UIPasteboard generalPasteboard];
    [pb setString:self.text];
}

- (BOOL) canPerformAction: (SEL) action withSender: (id) sender
{
    return (action == @selector(copy:));
}

- (void) handleTap: (UIGestureRecognizer*) recognizer
{
    [self becomeFirstResponder];
    UIMenuController *menu = [UIMenuController sharedMenuController];
    [menu setTargetRect:self.frame inView:self.superview];
    [menu setMenuVisible:YES animated:YES];
}

- (BOOL) canBecomeFirstResponder
{
    return YES;
}

@end
