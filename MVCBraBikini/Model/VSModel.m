//
//  VSModel.m
//  MVCBraBikini
//
//  Created by Văn Tiến Tú on 1/4/16.
//  Copyright © 2016 ZooStudio. All rights reserved.
//

#import "VSModel.h"

@implementation VSModel

- (instancetype) init:(NSString *)name withMeaure:(NSString *)measure andPhoto:(UIImage *)photo {
    if (self = [super init]) {
        self.name = name;
        self.measure = measure;
        
        NSString *photoFile = [NSString stringWithFormat:@"%@.jpg", photo];
        self.photo = [UIImage imageNamed:photoFile];
        
        NSString *iconFile = [NSString stringWithFormat:@"%@f.jpeg", photo];
        self.icon = [UIImage imageNamed:iconFile];
    }
    
    return self;
}
@end
