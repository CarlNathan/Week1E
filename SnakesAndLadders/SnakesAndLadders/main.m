//
//  main.m
//  SnakesAndLadders
//
//  Created by Carl Udren on 1/17/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameBoard.h"
#import "PlayerToken.h"
#import "GameBoardSquare.h"
#import "InputController.h"

int main(int argc, const char * argv[]) {
    {
        InputController *input = [InputController new];
        NSString *inputSizeString = [input inputForPrompt:@"Please enter a game board size"];
        NSInteger size = [inputSizeString integerValue];
        
        NSString *inputDifficulty = [input inputForPrompt:@"Please enter a difficulty level: e, m, or h"];
        
        GameBoard *gameBoard = [GameBoard gameBoardWithSize:size difficulty:inputDifficulty];
        
        NSString *inputPlayer1Name = [input inputForPrompt:@"Please enter name for player 1"];
        NSString *inputPlayer2Name = [input inputForPrompt:@"Please enter name for player 2"];
        PlayerToken *player1 = [PlayerToken playerTokenWithName:inputPlayer1Name];
        PlayerToken *player2 = [PlayerToken playerTokenWithName:inputPlayer2Name];
        
        
        while (YES) {
            //Player 1 turn
            NSString *inputPlayer1RollString = [input inputForPrompt:@"What did player1 roll?"];
            NSInteger moveDistance1 = [inputPlayer1RollString integerValue];
            [player1 move:moveDistance1];
            NSLog(@"%@ has moved forward to space %ld", player1.name, player1.location);
            GameBoardSquare *square1 = gameBoard.gameBoardArray[player1.location];
            if (square1.hasSnake && player1.location == square1.startPoint) {
                player1.location = square1.endPoint;
                NSLog(@"%@ has hit a snake!  They have been moved back to space %ld", player1.name, player1.location);
            }
            if (square1.hasLadder && player1.location == square1.startPoint) {
                player1.location = square1.endPoint;
                NSLog(@"%@ has found a ladder!  They have been moved forward to space %ld", player1.name, player1.location);
            }
            
            //player 2 turn
            NSString *inputPlayer2RollString = [input inputForPrompt:@"What did player2 roll?"];
            NSInteger moveDistance2 = [inputPlayer2RollString integerValue];
            [player2 move:moveDistance2];
            NSLog(@"%@ has moved forward to space %ld", player2.name, player2.location);
            GameBoardSquare *square2 = gameBoard.gameBoardArray[player2.location];
            if (square2.hasSnake && player2.location == square2.startPoint) {
                player2.location = square2.endPoint;
                NSLog(@"%@ has hit a snake!  They have been moved back to space %ld", player2.name, player2.location);
            }
            if (square2.hasLadder && player2.location == square2.startPoint) {
                player2.location = square2.endPoint;
                NSLog(@"%@ has found a ladder!  They have been moved forward to space %ld", player2.name, player2.location);
            }

            if (player1.location > gameBoard.gameBoardArray.count) {
                NSLog(@"%@ wins!", player1.name);
                break;
            }
            if (player2.location > gameBoard.gameBoardArray.count) {
                NSLog(@"%@ wins!", player2.name);
                break;
            }
        }


        

        NSLog(@"Hello, World!");
    }
    return 0;
}
