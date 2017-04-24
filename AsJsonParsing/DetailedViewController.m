//
//  DetailedViewController.m
//  AsJsonParsing
//
//  Created by Student P_08 on 17/04/17.
//  Copyright © 2017 Afsana. All rights reserved.
//

#import "DetailedViewController.h"

@interface DetailedViewController ()

@end

@implementation DetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.img_View.layer.cornerRadius=10.0f;
    self.img_View.layer.borderWidth = 3.0f;
    self.img_View.layer.borderColor = [UIColor redColor].CGColor;
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)loadData
{
    self.lbl_Author.text=self.strName;
    self.lbl_Descritption.text=self.strDescription;
    dispatch_async(dispatch_get_main_queue(), ^{
    
       self.img_View.image=self.image;
            });
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
