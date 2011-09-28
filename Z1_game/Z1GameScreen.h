//
//  Z1GameScreen.h
//  Z1_game
//
//  Created by Doug Whitmore on 7/19/11.
//  Copyright 2011 Good Doug. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GDGameScreenProtocol.h"
#import "Z1GameOverOverlay.h"

@class GDInputManager;

@interface Z1GameScreen : CCLayerColor <GDGameScreenProtocol>
{
    GDInputManager* _inputManager;
    CCSprite* _playerSprite;
    NSMutableArray* _enemySprites;
    NSMutableSet* _playerShots;
    float _time;
    int _spawnerIndex;
    BOOL _started;
    BOOL _gameOver;
    
    NSArray* _effects;
    NSDictionary* _levelDescription;
    CCSprite* _backgroundSprite;
    NSArray* _spawners;
    Z1GameOverOverlay* _gameOverScreen;
    CCLabelAtlas* _scoreLabel;
}

@property (nonatomic, retain) NSDictionary* levelDescription;

+(CCScene*) scene;
+ (CCScene*) sceneWithDictionary:(NSDictionary*)levelDict;

- (id) initWithDictionary:(NSDictionary*)levelDict;

@end
