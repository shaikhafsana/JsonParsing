//
//  CustomTableViewCell.h
//  AsJsonParsing
//
//  Created by Student P_08 on 17/04/17.
//  Copyright © 2017 Afsana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img_View;
@property (weak, nonatomic) IBOutlet UILabel *lbl_AuthorName;

@property (weak, nonatomic) IBOutlet UILabel *lbl_Description;

@end
