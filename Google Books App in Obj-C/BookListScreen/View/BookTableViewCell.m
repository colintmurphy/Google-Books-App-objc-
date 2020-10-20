//
//  BookTableViewCell.m
//  Google Books App in Obj-C
//
//  Created by Colin Murphy on 10/14/20.
//

#import "BookTableViewCell.h"
#import "NetworkManager.h"

@interface BookTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *bookLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bookImageView;

@end

@implementation BookTableViewCell

NSString *reuseId = @"BookTableViewCell";

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    _bookImageView.image = nil;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setInfo:(NSString *_Nullable)title withImageUrlString:(NSString *_Nullable)imageUrlString {
    
    _bookLabel.text = title;
    
    [[NetworkManager shared] downloadImageWithUrl:imageUrlString completion:^(UIImage * _Nullable image) {
        if (image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self->_bookImageView.image = image;
            });
        }
    }];
}

@end
