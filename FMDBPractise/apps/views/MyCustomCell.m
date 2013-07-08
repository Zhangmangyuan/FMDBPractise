//
//  MyCustomCell.m
//  ZhangMengGe
//
//  Created by 张 茫原 on 12-10-8.
//  Copyright (c) 2012年 恒德炫艺. All rights reserved.
//

#import "MyCustomCell.h"

@implementation MyCustomCell
@synthesize imageview1=_imageview1,label1=_label1,label2=_label2;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        //左边大图
        self.imageview1 = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 57, 44)];
        self.imageview1.contentMode = UIViewContentModeScaleToFill;
//        self.imageview1.backgroundColor = [UIColor orangeColor];
        self.imageview1.userInteractionEnabled = YES;
                
        //标题
        self.label1 = [[UILabel alloc]initWithFrame:CGRectMake(88, 10, 200, 15)];
        [self.label1 setFont:[UIFont systemFontOfSize:12.0]];
        self.label1.textAlignment = NSTextAlignmentLeft;
        self.label1.backgroundColor = [UIColor clearColor];
        
        //副标题
        self.label2 = [[UILabel alloc]initWithFrame:CGRectMake(88, 39, 181, 12)];
        [self.label2 setFont:[UIFont systemFontOfSize:12.0]];
        self.label2.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.imageview1];
        [self addSubview:self.label1];
        [self addSubview:self.label2];       
    }
    return self;
}
  

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
