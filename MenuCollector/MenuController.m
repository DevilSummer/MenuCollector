//
//  MenuController.m
//  MenuCollector
//
//  Created by Xia on 2021/4/14.
//

#import "MenuController.h"

@interface MenuController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (weak, nonatomic) IBOutlet UIScrollView *baseScrollView;
@property (weak, nonatomic) IBOutlet UIView *firstContainerView;
@property (weak, nonatomic) IBOutlet UIView *secondContainerView;
@property (weak, nonatomic) IBOutlet UIView *thirdContainerView;

@end

@implementation MenuController

#pragma mark - UI
- (void)commonInit {
    [self setUI];
}

- (void)setUI {

}

#pragma mark LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self commonInit];
}

#pragma mark - Action & Event
- (IBAction)tapSegmentControl:(id)sender {
    NSInteger index = self.segmentControl.selectedSegmentIndex;
    [self.baseScrollView setContentOffset:CGPointMake(self.baseScrollView.bounds.size.width * index, 0) animated:YES];

}

#pragma mark - Delegate
#pragma mark UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@_%@", self.title, @(indexPath.row)];
    return cell;
    
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    static NSInteger index = 0;
    index = (NSInteger)(scrollView.contentOffset.x / scrollView.bounds.size.width);
    self.segmentControl.selectedSegmentIndex = index;
}
@end
