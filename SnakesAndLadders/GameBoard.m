//
//  GameBoard.m
//  SnakesAndLadders
//
//  Created by Carl Udren on 1/17/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "GameBoard.h"
#import "GameBoardSquare.h"

@implementation GameBoard

+ (instancetype) gameBoardWithSize: (NSInteger) size difficulty: (NSString *) difficulty{
    GameBoard *gameBoard = [[GameBoard alloc] init];
    NSInteger boardSize = size *size;
    NSMutableArray *mutableGameBoardArray = [gameBoard generateSnakesAndLadders:difficulty size: size];
    for (int i = 0; i > boardSize; i++) {
        if (!mutableGameBoardArray[i]) {
            mutableGameBoardArray[i] = [[GameBoardSquare alloc] init];
        }
    }
    gameBoard.gameBoardArray = [mutableGameBoardArray copy];
    return gameBoard;
}

#pragma mark - helper methods

- (NSMutableArray *) generateSnakesAndLadders: (NSString *) difficulty size: (NSInteger) size{
   
    NSInteger spaces = size*size;
    NSInteger numberOFSnakes;
    NSInteger numberOfLadders;
    
    if ([difficulty isEqualToString:@"h"]) {
        numberOFSnakes = spaces/5;
        numberOfLadders = spaces/5;
    } else if ([difficulty isEqualToString:@"m"]) {
        numberOFSnakes = spaces/5;
        numberOfLadders = spaces/5;
    } else {
        numberOFSnakes = spaces/5;
        numberOfLadders = spaces/5;
    }
    
    NSMutableArray *mutableGameBoardArray = [NSMutableArray arrayWithCapacity: spaces];

    for (int i = 0; i <= spaces; i++) {
        mutableGameBoardArray[i] = [[GameBoardSquare alloc] init];
    }
    
    for (int i = 0; i <= numberOfLadders+numberOFSnakes; i++) {
        GameBoardSquare *snakeOrLadder = [[GameBoardSquare alloc] init];
        snakeOrLadder.startPoint = [self generateRandomPositionsArray:mutableGameBoardArray];
        snakeOrLadder.endPoint = [self generateRandomPositionsArray:mutableGameBoardArray];
        snakeOrLadder.hasLadder = YES; snakeOrLadder.hasSnake = YES;
        mutableGameBoardArray[snakeOrLadder.startPoint] = snakeOrLadder;
        mutableGameBoardArray[snakeOrLadder.endPoint] = snakeOrLadder;
        
    }
    
    
    for (int i = 0; i < numberOFSnakes; i++) {
        //generate snakes
        NSInteger r = [self findRandomPair:mutableGameBoardArray];
        GameBoardSquare *snake = mutableGameBoardArray[r];
        snake.hasLadder = NO;
        if (snake.startPoint > snake.endPoint) {
            continue;
        } else {
            NSInteger placeholder = snake.endPoint;
            snake.endPoint = snake.startPoint;
            snake.startPoint = placeholder;
        }
    }
    for (int i = 0; i < numberOfLadders; i++) {
        //generate ladders
        NSInteger r = [self findRandomPair:mutableGameBoardArray];
        GameBoardSquare *ladder = mutableGameBoardArray[r];
        ladder.hasSnake = NO;
        if (ladder.startPoint < ladder.endPoint) {
            continue;
        } else {
            NSInteger placeholder = ladder.endPoint;
            ladder.endPoint = ladder.startPoint;
            ladder.startPoint = placeholder;
        }
    }
    return mutableGameBoardArray;
}

- (NSInteger) generateRandomPositionsArray: (NSMutableArray *) array{
    while (YES) {
        NSInteger r = arc4random_uniform(array.count -1);
        if ([array[r] hasSnake] || [array[r] hasLadder]) {
            continue;
        } else {
            return r;
        }
    }
}

- (NSInteger) findRandomPair: (NSMutableArray *) array{
    while (YES) {
        NSInteger r = arc4random_uniform(array.count -1 );
        if ([array[r] hasSnake] && [array[r] hasLadder]) {
            return r;
        } else {
            continue;
        }
    }
}

@end
