//
//  CardMatchingGame.m
//  CardGame
//
//  Created by Vikash Soni on 01/07/14.
//  Copyright (c) 2014 Vikash Soni. All rights reserved.
//

#import "CardMatchingGame.h"


@interface CardMatchingGame()

{
    NSMutableArray *activeCard;

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
    
    activeCard = [[NSMutableArray alloc] init];
    
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
    NSLog(@"index %d",index);
    
    

    if (!card.isMatched)
    {
        if (card.isChosen)
        {
            [activeCard addObject:card];
            card.chosen = NO;
            [activeCard removeAllObjects];
        }
        
        else if ([activeCard count] == 0)
        {
            self.score -= COST_TO_CHOOSE;
            card.matched = NO;
            
            card.chosen = YES;
            [activeCard addObject:card];
            NSLog(@"%d",[activeCard count]);
        }
        
        else
        {
            for (Card *otherCard in self.cards)
            {
                if (otherCard.isChosen && !otherCard.isMatched)
                {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore)
                    {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    }
                    
                    else
                    {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return  (index < [self.cards count]) ? self.cards[index] : nil;
}

@end
