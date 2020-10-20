//
//  VolumeInfo.m
//  Google Books App in Obj-C
//
//  Created by Colin Murphy on 10/15/20.
//

#import "VolumeInfo.h"
#import "BookImageInfo.h"

@implementation VolumeInfo

- (instancetype)initWithDict:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        self.title = [dictionary objectForKey:@"title"];
        self.publishDate = [dictionary objectForKey:@"publishedDate"];
        self.authors = [dictionary objectForKey:@"authors"];
        self.publisher = [dictionary objectForKey:@"publisher"];
        self.bookDescription = [dictionary objectForKey:@"description"];
        self.imageInfo = [[BookImageInfo alloc] initWithDict:[dictionary objectForKey:@"imageLinks"]];
    }
    return self;
}

@end
