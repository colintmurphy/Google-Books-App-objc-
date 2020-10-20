//
//  BookImageInfo.h
//  Google Books App in Obj-C
//
//  Created by Colin Murphy on 10/14/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BookImageInfo : NSObject

@property (strong, nonatomic) NSString *thumbNail;
@property (strong, nonatomic) NSString *smallThumbNail;

- (instancetype)initWithDict:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
