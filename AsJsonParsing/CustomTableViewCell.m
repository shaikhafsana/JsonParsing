//
//  CustomTableViewCell.m
//  AsJsonParsing
//
//  Created by Student P_08 on 17/04/17.
//  Copyright © 2017 Afsana. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.img_View.layer.cornerRadius = self.img_View.frame.size.width / 2;
    self.img_View.layer.cornerRadius=self.img_View.frame.size.height/2;
    self.img_View.clipsToBounds = YES;}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
