//
//  CardMatchingGame.m
//  CardGame
//
//  Created by Vikash Soni on 01/07/14.
//  Copyright (c) 2014 Vikash Soni. All rights reserved.
//

#import "CardMatchingGame.h"


@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong)    NSMutableArray *cards;

@end

@implementation CardMatchingGame

-(NSMutableArray *)cards

{
    if (_cards)
        _cards = [[NSMutableArray alloc] init];
    
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck*)deck
{
    self = [super init];
    
    
    
    
    return self;
}

-(void)chooseCardAtIndex:(NSUInteger)index
{
    
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return 0;
}



@end
