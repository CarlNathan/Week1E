//
//  GameBoardSquare.h
//  SnakesAndLadders
//
//  Created by Carl Udren on 1/17/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameBoardSquare : NSObject

@property (nonatomic, assign) BOOL hasSnake;
@property (nonatomic, assign) BOOL hasLadder;
@property (nonatomic, assign) NSInteger startPoint;
@property (nonatomic, assign) NSInteger endPoint;

@end
