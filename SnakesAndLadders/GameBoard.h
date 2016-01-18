//
//  GameBoard.h
//  SnakesAndLadders
//
//  Created by Carl Udren on 1/17/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameBoard : NSObject

@property (nonatomic, strong) NSArray *gameBoardArray;

+ (instancetype) gameBoardWithSize: (NSInteger) size difficulty: (NSString *) difficulty;

@end
