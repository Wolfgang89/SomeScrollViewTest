//
//  ViewController.m
//  somescrollviewtest
//
//  Created by panwg on 2019/3/7.
//  Copyright © 2019年 Will. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation ViewController
- (UITableView*)tableView{
    if (nil ==_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(20, 140, self.view.frame.size.width -40, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor redColor];
        _tableView.scrollEnabled = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 90;
        _tableView.layer.cornerRadius = 20;
        [self.scrollView addSubview:_tableView];
    }
    return  _tableView;
}
- (UIScrollView*)scrollView {
    if (nil ==_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.backgroundColor = [UIColor blueColor];
        _scrollView.frame = self.view.frame;
        _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 90 *10);
        ////  scrollview 的contentSize 需要计算   根据数据的多少计算  计算出总共的数据的高 在给scroolView的contentSize.height
        
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.view setNeedsUpdateConstraints];
    
}

- (void)updateViewConstraints{
    [super updateViewConstraints];
    
//    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.scrollView).offset(10);
//        make.bottom.mas_equalTo(self.scrollView.mas_bottom);
//        make.width.mas_equalTo(self.scrollView).offset(10);
//        make.top.mas_equalTo(self.scrollView).offset(50);
//    }];
    
//    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.width.top.height.mas_equalTo(self.view);
//    }];
    
    
    /// 确定scrollview的cs
//    [self.scrollView.bottomAnchor constraintEqualToAnchor:self.tableView.bottomAnchor constant:10];

//    [self.scrollView.contentLayoutGuide.bottomAnchor  constraintEqualToAnchor: self.tableView.contentLayoutGuide.bottomAnchor];
//
//    self.tableView.contentLayoutGuide = self.scrollView.contentLayoutGuide;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell  =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.backgroundColor = [UIColor  greenColor];
    
    return cell;
}
@end
