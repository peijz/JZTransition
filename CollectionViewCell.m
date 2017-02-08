//
//  CollectionViewCell.m
//  JZTransition
//
//  Created by wanhongios on 17/1/26.
//  Copyright © 2017年 wanhongios. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.imgView];
    }
    return self;
    
}

-(UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imgView.image = [UIImage imageNamed:@"img"];
        
    }
    return _imgView;
}

@end
