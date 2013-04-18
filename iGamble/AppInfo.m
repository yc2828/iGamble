//
//  GameInfo.m
//  iGamble
//
//  Created by Binyan Chen on 4/2/13.
//  Copyright (c) 2013 Binyan Chen. All rights reserved.
//

#import "AppInfo.h"

@implementation AppInfo


static AppInfo *instance =nil;
+(AppInfo *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {  
            instance= [AppInfo new];
        }
    }
    return instance;
}

@end
    