//
//  ViewController.m
//  TitleScollView
//
//  Created by xiaojie on 16/10/11.
//  Copyright © 2016年 QiHao. All rights reserved.
//

#import "ViewController.h"
#import "TitleScrollViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


static NSString *cellId = @"test";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    [self.tableView setTableFooterView:[UIView new]];
    
   
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test"];
    if (indexPath.row == 0) {
         cell.textLabel.text = @"文本可滑动的titleScrollView";
    }
    if (indexPath.row == 1) {
        cell.textLabel.text = @"富文本文本可滑动的titleScrollView";
    }
   
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld", indexPath.row);
    TitleScrollViewController *titleScorllVc = [[TitleScrollViewController alloc] init];
    if (indexPath.row == 0) {
         titleScorllVc.vcType = TitleScroVcTypeText;
    }
    if (indexPath.row == 1) {
         titleScorllVc.vcType = TitleScroVcTypeAttributeText;
    }
   
    [self.navigationController pushViewController:titleScorllVc animated:YES];
    
}





@end
