//
//  NetworkManager.m
//  Google Books App in Obj-C
//
//  Created by Colin Murphy on 10/14/20.
//

#import <UIKit/UIKit.h>

#import "Book.h"
#import "NetworkManager.h"

@implementation NetworkManager

+ (instancetype)shared {
    
    static NetworkManager *manager;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        manager = [[NetworkManager alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)requestWithUrl:(NSString *)urlString completion:(void (^)(NSMutableArray<Book *> *_Nullable, NSError *_Nullable))completion {
    
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        
        if (httpResponse.statusCode == 200) {
            
            NSError *parseError = nil;
            NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&parseError];
            
            if (parseError) {
                completion(nil, error);
                return;
            }
            
            NSMutableArray<Book *> *bookList = [[NSMutableArray alloc]init];
            NSDictionary *itemsInJSON = dataDictionary[@"items"];
            
            for (NSDictionary *book in itemsInJSON) {
                Book *currentBook = [[Book alloc] initWithDict:book];
                [bookList addObject:currentBook];
            }
            completion(bookList, nil);
            
        } else {
            completion(nil, error);
        }
    }];
    [dataTask resume];
}

- (void)downloadImageWithUrl:(NSString *)urlString completion:(void (^)(UIImage * _Nullable))completion {
    
    NSData *imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: urlString]];
    completion([UIImage imageWithData:imageData]);
}

@end
