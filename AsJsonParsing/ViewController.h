//
//  ViewController.h
//  AsJsonParsing
//
//  Created by Student P_08 on 17/04/17.
//  Copyright © 2017 Afsana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *arrayarticles;
    NSDictionary *dictArticles;
        }
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIActivityIndicatorView *tableViewActivityIndicator;

@end

