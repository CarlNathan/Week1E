//
//  PlayerToken.h
//  SnakesAndLadders
//
//  Created by Carl Udren on 1/17/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayerToken : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger location;

+ (instancetype) playerTokenWithName: (NSString *) name;

-(void) move: (NSInteger) roll;

@end
