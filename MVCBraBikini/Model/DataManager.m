//
//  DataManager.m
//  MVCBraBikini
//
//  Created by Văn Tiến Tú on 1/4/16.
//  Copyright © 2016 ZooStudio. All rights reserved.
//

#import "DataManager.h"
#import "VSModel.h"

@implementation DataManager

+ (instancetype) getSingleton {
    static DataManager  *dataManager = nil;
    static dispatch_once_t disPathOnce;
    
    dispatch_once (&disPathOnce, ^{
        dataManager = [self new];
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"VictoriaSecret" ofType:@"plist"];
        
        NSArray *raw = [NSArray arrayWithContentsOfFile:filePath];
        NSMutableArray *temp = [[NSMutableArray alloc] initWithCapacity:raw.count];
        
        for (NSDictionary *item in raw) {
            VSModel *vsModel = [[VSModel alloc] init:[item valueForKey:@"name"]
                                          withMeaure:[item valueForKey:@"measure"]
                                            andPhoto:[item valueForKey:@"photo"]];
            
            [temp addObject:vsModel];
            
        }
        dataManager.data = [NSArray arrayWithArray:temp];
    });
    
    return dataManager;
}
@end
