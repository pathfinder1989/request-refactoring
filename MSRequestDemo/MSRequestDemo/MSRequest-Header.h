//
//  MSRequest-Header.h
//  MSRequestDemo
//
//  Created by meishi on 29/08/2017.
//  Copyright © 2017 Kangbo. All rights reserved.
//

#ifndef MSRequest_Header_h
#define MSRequest_Header_h

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger , MSRequestMethod) {
    /** request method get */
    MSRequestMethodGet = 0,
    /** request method post */
    MSRequestMethodPost,
    /** request method put */
    MSRequestMethodPut,
    //......
};

@class MSRequest;
typedef void(^MSRequestCompletion)(MSRequest *request);



#endif /* MSRequest_Header_h */
