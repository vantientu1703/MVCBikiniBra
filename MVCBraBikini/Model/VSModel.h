//
//  VSModel.h
//  MVCBraBikini
//
//  Created by Văn Tiến Tú on 1/4/16.
//  Copyright © 2016 ZooStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface VSModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *measure;
@property (nonatomic, strong) UIImage *photo;
@property (nonatomic, strong) UIImage *icon;

- (instancetype) init: (NSString *) name
           withMeaure: (NSString *) measure
             andPhoto: (NSString *) photo;
@end
