//
//  DataManager.h
//  MVCBraBikini
//
//  Created by Văn Tiến Tú on 1/4/16.
//  Copyright © 2016 ZooStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject


@property (nonatomic, strong) NSArray *data;

+ (instancetype) getSingleton;
@end
