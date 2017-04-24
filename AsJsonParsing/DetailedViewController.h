//
//  DetailedViewController.h
//  AsJsonParsing
//
//  Created by Student P_08 on 17/04/17.
//  Copyright © 2017 Afsana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailedViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *img_View;
@property (weak, nonatomic) IBOutlet UILabel *lbl_Author;
@property (weak, nonatomic) IBOutlet UILabel *lbl_Descritption;
@property(strong,nonatomic)NSString *strDescription;
@property(strong,nonatomic)NSString *strName;
@property(strong,nonatomic)UIImage *image;
@end
