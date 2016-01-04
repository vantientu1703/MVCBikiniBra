//
//  CustomTableViewCell.h
//  MVCBraBikini
//
//  Created by Văn Tiến Tú on 1/4/16.
//  Copyright © 2016 ZooStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelMeasure;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
