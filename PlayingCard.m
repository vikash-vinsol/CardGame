//
//  PlayingCard.m
//  CardGame
//
//  Created by Vikash Soni on 27/06/14.
//  Copyright (c) 2014 Vikash Soni. All rights reserved.


#import "PlayingCard.h"
#import "Constants.h"

@implementation PlayingCard
@synthesize suit = _suit;


-(int)match:(NSArray *)otherCards
{
    int score = 0;
    BOOL rankMatch = true;
    BOOL suitMatch = true;
    
    if ([otherCards count] == CARDS_IN_GAME -1)
    {
        for (PlayingCard *compareCard in otherCards)
        {
            if (suitMatch && [self.suit isEqualToString:compareCard.suit])
            {
                score += 2;
                rankMatch = false;
            }
            
            else if (rankMatch && self.rank == compareCard.rank)
            {
                score += 4;
                suitMatch = false;
            }
            else
            {
                score = 0;
                break;
            }
        }
    }
    
    return score;
}

-(NSString *)contents
{
    NSArray *rankString = [PlayingCard rankString];
    
    return [rankString[self.rank] stringByAppendingString:self.suit];
}

+ (NSArray *)validSuits
{
    return @[@"♦",@"♣",@"♥",@"♠"];
}

+ (NSUInteger)maxRank
{
    return [[self rankString] count] -1;
}

+ (NSArray *)rankString
{
    return @ [@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

-(void)setSuit:(NSString *)suit
{
    if (![[PlayingCard validSuits] containsObject:self.suit])
    {
        _suit = suit;
    }
}

- (NSString *)suit
{
	return _suit ? _suit : @"?";
}

-(void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank])
    {
        _rank = rank;
    }
}

@end
