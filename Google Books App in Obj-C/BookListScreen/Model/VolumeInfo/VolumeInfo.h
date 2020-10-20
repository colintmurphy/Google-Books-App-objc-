//
//  VolumeInfo.h
//  Google Books App in Obj-C
//
//  Created by Colin Murphy on 10/15/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class BookImageInfo;

@interface VolumeInfo : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *publishDate;
@property (strong, nonatomic) NSArray *authors;
@property (strong, nonatomic) NSString *publisher;
@property (strong, nonatomic) NSString *bookDescription;
@property (strong, nonatomic) BookImageInfo *imageInfo;

- (instancetype)initWithDict:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
