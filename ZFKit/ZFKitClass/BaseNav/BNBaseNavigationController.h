
/*
 * 作为导航基类使用，覆盖了push pop 方法作为辅助
 */

#import <UIKit/UIKit.h>

@interface BNBaseNavigationController : UINavigationController <UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@property(nonatomic, assign) BOOL interactivePop;

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

- (void)popToViewControllerWithName:(NSString*)clsName animated:(BOOL)animated;

@end
