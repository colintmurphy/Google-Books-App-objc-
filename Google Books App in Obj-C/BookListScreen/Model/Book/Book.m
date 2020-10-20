//
//  Book.m
//  Google Books App in Obj-C
//
//  Created by Colin Murphy on 10/14/20.
//

#import "Book.h"
#import "VolumeInfo.h"

@implementation Book

- (instancetype)initWithDict:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        self.volumeInfo = [[VolumeInfo alloc] initWithDict:[dictionary objectForKey:@"volumeInfo"]];
    }
    return self;
}

@end
