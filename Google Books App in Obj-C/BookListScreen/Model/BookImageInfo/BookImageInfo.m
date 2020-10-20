//
//  BookImageInfo.m
//  Google Books App in Obj-C
//
//  Created by Colin Murphy on 10/14/20.
//

#import "BookImageInfo.h"

@implementation BookImageInfo

- (instancetype)initWithDict:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        self.thumbNail = [dictionary objectForKey:@"thumbnail"];
        self.smallThumbNail = [dictionary objectForKey:@"smallThumbnail"];
    }
    return self;
}

@end
