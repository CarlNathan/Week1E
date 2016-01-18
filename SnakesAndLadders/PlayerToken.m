//
//  PlayerToken.m
//  SnakesAndLadders
//
//  Created by Carl Udren on 1/17/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "PlayerToken.h"

@implementation PlayerToken

+ (instancetype) playerTokenWithName: (NSString *) name{
    PlayerToken *player = [[PlayerToken alloc] init];
    player.name = name;
    player.location = 0;
    return player;
}


- (void) move: (NSInteger) roll{
    self.location = self.location + roll;
    
}


@end
