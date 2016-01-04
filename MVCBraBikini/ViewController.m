//
//  ViewController.m
//  MVCBraBikini
//
//  Created by Văn Tiến Tú on 1/4/16.
//  Copyright © 2016 ZooStudio. All rights reserved.
//

#import "ViewController.h"
#import "DataManager.h"
#import "VSModel.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UILabel *modelLabel;

@end

@implementation ViewController
{
    DataManager *dataManager;
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    dataManager = [DataManager getSingleton];
    self.pageControl.numberOfPages = dataManager.data.count;
    
    CGSize sizeScrollView = self.scrollView.bounds.size;
    self.scrollView.contentSize = CGSizeMake(sizeScrollView.width * dataManager.data.count, sizeScrollView.height);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    
    int i = 0;
    for (VSModel *model in dataManager.data) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:model.photo];
        imageView.frame = CGRectMake(i * sizeScrollView.width, 0, sizeScrollView.width, sizeScrollView.height);
        [self.scrollView addSubview:imageView];
        i ++;
    }
    [self updateLabelAt:0];
}

#pragma mark - UIScrollViewDelegate

- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    
    self.pageControl.currentPage = self.scrollView.contentOffset.x / self.scrollView.bounds.size.width;
    [self updateLabelAt:(int)self.pageControl.currentPage];
}

#pragma mark - Util functions 

- (void) updateLabelAt: (int) index {
    VSModel *vsModel = dataManager.data[index];
    
    self.modelLabel.text = [NSString stringWithFormat:@"%@\n%@", vsModel.name, vsModel.measure];
    CGSize labelSize = [self.modelLabel.text sizeWithAttributes:@{NSFontAttributeName:self.modelLabel.font}];
    
    self.modelLabel.frame = CGRectMake(self.modelLabel.frame.origin.x, self.modelLabel.frame.origin.y, self.modelLabel.frame.size.width, labelSize.height);
}

- (IBAction)onPageControlChange:(id)sender {
    
    self.scrollView.contentOffset = CGPointMake(self.pageControl.currentPage * self.scrollView.bounds.size.width, 0);
}


@end
