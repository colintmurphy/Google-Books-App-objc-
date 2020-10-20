//
//  BookTableViewCell.h
//  Google Books App in Obj-C
//
//  Created by Colin Murphy on 10/14/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BookTableViewCell : UITableViewCell

- (void)setInfo:(NSString *_Nullable)title withImageUrlString:(NSString *_Nullable)imageUrlString;

@end

NS_ASSUME_NONNULL_END
