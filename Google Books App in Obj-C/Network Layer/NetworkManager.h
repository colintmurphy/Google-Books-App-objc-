//
//  NetworkManager.h
//  Google Books App in Obj-C
//
//  Created by Colin Murphy on 10/14/20.
//

#import <Foundation/Foundation.h>

#import "Book.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject

+ (instancetype)shared;

- (void)requestWithUrl:(NSString *)urlString completion:(void (^)(NSMutableArray<Book *> *_Nullable data, NSError *_Nullable error))completion;
- (void)downloadImageWithUrl:(NSString *)urlString completion:(void (^)(UIImage* _Nullable image))completion;

@end

NS_ASSUME_NONNULL_END
