//
//  GDEnemySpriteEmitter.m
//  MenuTest
//
//  Created by Doug Whitmore on 7/11/11.
//  Copyright 2011 Apple Computer Inc. All rights reserved.
//

#import "GDEnemySpriteEmitter.h"
#import "GDAnimationManager.h"
#import "Z1GameScreen.h"

@interface GDEnemySpriteEmitter()

@property (readonly) float intervalBetweenSpawns;
@property int spawned;
@property (nonatomic, retain) NSDictionary* spriteDict;

@end

@implementation GDEnemySpriteEmitter

@synthesize howMany, howLong, time, frameAnimation = _frameAnimation, movementAnimation = _movementAnimation;
@synthesize spawned, spriteDict = _spriteDict;


- (void) dealloc
{
    [_frameAnimation release];
    [_movementAnimation release];
    
    [super dealloc];
}

- (id) initWithDictionary:(NSDictionary*)inDict
{
    if (( self = [super init] ))
    {
        self.howLong = [[inDict objectForKey:@"howLong"] intValue];
        self.howMany = [[inDict objectForKey:@"howMany"] intValue];
        self.movementAnimation = [[GDAnimationManager sharedAnimationManager] movementAnimationForKey:[inDict objectForKey:@"animation"]];
        if([inDict objectForKey:@"x"])
            self.position = ccp([[inDict objectForKey:@"x"] floatValue], [[inDict objectForKey:@"y"] floatValue]);
        else
            self.position = ccp(512, 383);
        
        if ([inDict objectForKey:@"rotation"]) 
        {
            self.rotation = [[inDict objectForKey:@"rotation"] floatValue];
        }
        self.spriteDict = [inDict objectForKey:@"sprite"];
    }
    return self;
}

- (id) init
{
    if ((self = [super init]))
    {
        self.time = 0.0;
        self.spawned = 0;
    }
    return self;
}

- (void) update:(ccTime)dt
{
    self.time = self.time + dt;
    if (self.time >= self.intervalBetweenSpawns && self.spawned < self.howMany)
    {
        [self spawnSprite];
        self.spawned++;
        self.time = self.time - self.intervalBetweenSpawns;
    }
}

- (float) intervalBetweenSpawns
{
    return (float)howLong/(float)howMany;
}

- (void) spawnSprite
{
    // create a new sprite and add it to the parent
    GDEnemyBaseSprite* enemySprite = [GDEnemyBaseSprite spriteWithDict:self.spriteDict];
    enemySprite.position = self.position;
    enemySprite.rotation = self.rotation;
    enemySprite.animBlock = self.movementAnimation;
    
    [(Z1GameScreen*)self.parent addEnemySprite:enemySprite];
}

- (void) movementAnimtationForName:(NSString*)moveName
{
    
}

@end
