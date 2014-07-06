//
//  PlayingCard.h
//  CardGame
//
//  Created by Vikash Soni on 27/06/14.
//  Copyright (c) 2014 Vikash Soni. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (nonatomic, strong) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
