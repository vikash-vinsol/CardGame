//
//  CardMatchingGame.m
//  CardGame
//
//  Created by Vikash Soni on 01/07/14.
//  Copyright (c) 2014 Vikash Soni. All rights reserved.
//

#import "CardMatchingGame.h"
#import "Constants.h"


@interface CardMatchingGame()

{
    NSMutableArray *activeCards;
}

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong)    NSMutableArray *cards;

@end

@implementation CardMatchingGame

-(NSMutableArray *)cards
{
    if (!_cards)
        _cards = [[NSMutableArray alloc] init];
    
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck*)deck
{
    self = [super init];
    
    activeCards = [[NSMutableArray alloc] init];
    
    if (self)
    {
        for (int i = 0; i<count; i++)
        {
            Card *card = [deck drawRandomCard];
            
            if (card)
            {
                [self.cards addObject:card];
            }
            
            else
            {
                self = nil;
                break;
            }
        }
    }
    return self;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;


-(void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    if (!card.isMatched)
    {
        if (card.isChosen)
        {
            card.chosen = NO;
            [activeCards removeObject:card];
        }
        
        else if ([activeCards count] < CARDS_IN_GAME - 1)
        {
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
            [activeCards addObject:card];
        }
        
        else
        {
                    int matchScore = [card match:activeCards];
                    
                    if (matchScore)
                    {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        card.chosen = YES;
                        
                        for (Card *activateCards in activeCards)
                        {
                            activateCards.matched = YES;
                            activateCards.chosen = YES;
                        }
                        
                        [activeCards removeAllObjects];
                    }
                    else
                    {
                        self.score -= MISMATCH_PENALTY;
                        
                        for (Card *activateCards in activeCards)
                        {
                            activateCards.chosen = NO;
                        }
                        
                        [activeCards removeAllObjects];
                        [activeCards addObject:card];
                    }
                        card.chosen = YES;
                        self.score -= COST_TO_CHOOSE;
        }
        
    }
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return  (index < [self.cards count]) ? self.cards[index] : nil;
}

@end
