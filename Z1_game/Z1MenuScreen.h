//
//  GDMenuScreen.h
//  Z1_game
//
//  Created by Doug Whitmore on 7/17/11.
//  Copyright 2011 Good Doug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDBaseEffectsScreen.h"
#import "cocos2d.h"
#import "Z1MessageOverlay.h"
#import "GDSpriteButton.h"

@interface Z1MenuScreen : GDBaseEffectsScreen 
{
    Z1MessageOverlay* _messageOverlay;
    NSArray* _buttonArray;
    GDSpriteButton* _activeButton;
    int activeIndex;
}

@property (nonatomic, retain) NSArray* buttonArray;
@property (nonatomic, retain) GDSpriteButton* activeButton;
@property int activeIndex;
@property (nonatomic, retain, readonly) Z1MessageOverlay* messageOverlay;

+(CCScene*) scene;

@end
