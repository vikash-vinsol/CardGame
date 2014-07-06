//
//  PlayingCard.m
//  CardGame
//
//  Created by Vikash Soni on 27/06/14.
//  Copyright (c) 2014 Vikash Soni. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit = _suit;


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
    NSLog(@"suit %@",suit);
    
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
        NSLog(@"rank %d",rank);
        _rank = rank;
    }
}

@end
