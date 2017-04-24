//
//  ViewController.m
//  AsJsonParsing
//
//  Created by Student P_08 on 17/04/17.
//  Copyright © 2017 Afsana. All rights reserved.
//

#import "ViewController.h"
#import "DetailedViewController.h"
#import "CustomTableViewCell.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       [self showActivityIndicator];
        [self LoadData];
}
-(void)showActivityIndicator
{
    self.tableViewActivityIndicator=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    self.tableViewActivityIndicator.color=[UIColor blueColor];
    self.tableViewActivityIndicator.activityIndicatorViewStyle=UIActivityIndicatorViewStyleGray;
    self.tableViewActivityIndicator.center=self.view.center;
    [self.tableViewActivityIndicator startAnimating];
    [self.view addSubview:self.tableViewActivityIndicator];
    [self showAlertwithTitle:@"Done!!!!" andMsg:@"Data loaded Sucessfully"];
}

-(void)LoadData
{
    NSString *urlString=@"https://newsapi.org/v1/articles?source=techcrunch&apiKey=efe99de73d1d49608eb3d4e87c536b26";
    NSURL *url=[NSURL URLWithString:urlString];
    NSURLSession *session=[NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask=[session dataTaskWithURL:url completionHandler:^(NSData *data,NSURLResponse *respone,NSError *error){
        if (data!=nil) {
            dictArticles=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            arrayarticles=[dictArticles valueForKey:@"articles"];
            NSLog(@"%@",arrayarticles);
            if (arrayarticles.count>0) {
                [_tableView reloadData];
                [self.tableViewActivityIndicator stopAnimating];
                [self.tableViewActivityIndicator setHidesWhenStopped:YES];
            }
            else{
                [self showAlertwithTitle:@"Error" andMsg:error.localizedDescription];
                [self.tableViewActivityIndicator stopAnimating];
                [self.tableViewActivityIndicator setHidesWhenStopped:YES];
            }
        }
        
    }
    ];
    [dataTask resume];
}
-(void)showAlertwithTitle:(NSString *)title andMsg:(NSString *)message
{
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action=[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:nil];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

{
    return arrayarticles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    CustomTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell==nil) {
        cell=[[CustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        
    }
  
    // NSDictionary *dictResult = [arrayarticles objectAtIndex:indexPath.row];
    NSString *strIcon=[[arrayarticles objectAtIndex:indexPath.row ]valueForKey:@"urlToImage"];
    NSData *imgData=[NSData dataWithContentsOfURL:[NSURL URLWithString:strIcon]];
    cell.img_View.image=[UIImage imageWithData:imgData];
    
    cell.lbl_AuthorName.text=[[arrayarticles objectAtIndex:indexPath.row ]valueForKey:@"author"];
 
    cell.lbl_Description.text=[[arrayarticles objectAtIndex:indexPath.row ]valueForKey:@"description"];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CustomTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
   DetailedViewController *obj = [story instantiateViewControllerWithIdentifier:@"DetailedViewController"];
    
    obj.strName = [NSString stringWithFormat:@"%@",cell.lbl_AuthorName.text];
    obj.strDescription= [NSString stringWithFormat:@"%@",cell.lbl_Description.text];
    obj.image = cell.img_View.image;
   
    
    [self.navigationController pushViewController:obj animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
