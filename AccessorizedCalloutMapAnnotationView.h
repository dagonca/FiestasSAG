#import <Foundation/Foundation.h>
#import "CalloutMapAnnotationView.h"

@interface AccessorizedCalloutMapAnnotationView : CalloutMapAnnotationView {
	UIButton *_accessory;
    UIButton *_accessory2;
}

- (void) calloutAccessoryTapped;
- (void) preventParentSelectionChange;
- (void) allowParentSelectionChange;
- (void) enableSibling:(UIView *)sibling;

@end
