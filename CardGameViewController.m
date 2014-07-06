//
//  CardGameViewController.m
//  CardGame
//
//  Created by Vikash Soni on 28/06/14.
//  Copyright (c) 2014 Vikash Soni. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCard.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (nonatomic, strong) Deck *deck;

@end

@implementation CardGameViewController

-(Deck *)deck
{
    if (!_deck)
    {
        _deck = [self createDeck];
    }
    return _deck;

}

-(Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)cardTouchButton:(UIButton *)sender
{
    if ([sender.currentTitle length])
    {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback.jpeg"] forState:UIControlStateNormal];
        
        [sender setTitle:@"" forState:UIControlStateNormal];
        self.flipCount ++;
    }
    
    else
    {
        Card *card =[self.deck drawRandomCard];
        
            if (card)
            {
                [sender setBackgroundImage:[UIImage imageNamed:@"white.jpeg"] forState:UIControlStateNormal];
                [sender setTitle:card.contents forState:UIControlStateNormal];
                self.flipCount ++;
            }
    }

    self.flipsLabel.text = [NSString stringWithFormat:@"FLIPS : %d",self.flipCount];
}

@end
