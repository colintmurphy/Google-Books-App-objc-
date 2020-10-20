//
//  Book.h
//  Google Books App in Obj-C
//
//  Created by Colin Murphy on 10/14/20.
//

#import <Foundation/Foundation.h>

@class VolumeInfo;

NS_ASSUME_NONNULL_BEGIN

@interface Book : NSObject

@property (strong, nonatomic) VolumeInfo *volumeInfo;

- (instancetype)initWithDict:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
