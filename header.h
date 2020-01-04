#import <SpringBoard/SpringBoard.h>

@interface SpringBoard ()
-(void)takeScreenshot;
@end

@interface SBGrabberTongue : NSObject
{
  UIPanGestureRecognizer *_edgePullGestureRecognizer;
  UIView *_tongueContainer;
}
@end

@interface SBFluidSwitcherGestureManager : NSObject
@property(retain, nonatomic) SBGrabberTongue *deckGrabberTongue; // @synthesize deckGrabberTongue=_deckGrabberTongue;
@end

@interface SBCoverSheetPrimarySlidingViewController : UIViewController
@property (retain, nonatomic) SBGrabberTongue *grabberTongue;
-(CGPoint)_locationForGesture:(id)arg1;
-(id)dismissGestureRecognizer;
@end

@interface FBScene : NSObject
-(int)currentInterfaceOrientation;
@end

@interface SBControlCenterController : NSObject
+(SBControlCenterController *)sharedInstance;
-(void)presentAnimated:(BOOL)animated;
@end

@interface SBLockScreenManager : NSObject
-(id)lockScreenViewController;
@end

@interface SBCoverSheetPresentationManager : NSObject
+(SBCoverSheetPresentationManager *)sharedInstance;
-(void)setCoverSheetPresented:(BOOL)arg1 animated:(BOOL)arg2 withCompletion:(id)arg3;
@end

@interface CSCoverSheetViewController : UIViewController
-(BOOL)isAuthenticated;
@end
