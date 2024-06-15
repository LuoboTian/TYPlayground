//
//  ViewController.m
//  TYPalyground
//
//  Created by yu tian on 2024/6/15.
//

#import "ViewController.h"
#import "TestViewController.h"


@interface ViewController ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, Class>* featureInfo;
@property (nonatomic, strong) NSMutableArray* featureList;

@end

@implementation ViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _featureInfo = [NSMutableDictionary new];
        _featureList = [NSMutableArray new];
        [self setup];
    }
    return self;
}

- (void)setup {
    [_featureInfo setObject:[TestViewController class] forKey:@"Test"];
    _featureList = [[_featureInfo allKeys] mutableCopy];
}




- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}


#pragma mark - UITableViewDataSource

// 填充每个表格的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier: NSStringFromClass([ViewController class])];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([ViewController class])];
    }
    cell.textLabel.text = [_featureList objectAtIndex:indexPath.row];
    return cell;
}

// 获取section数目
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// 每个section的数目
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_featureList count];
}

// row高度
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

#pragma mark - UITableViewDelegate
// 点击Table，执行的操作
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *key = [_featureList objectAtIndex:indexPath.row];
    Class class = _featureInfo[key];
    UIViewController *vc = [[class alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end