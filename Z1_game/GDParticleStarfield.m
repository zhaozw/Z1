//
//  GDParticleStarfield.m
//  MenuTest
//
//  Created by Doug Whitmore on 6/30/11.
//  Copyright 2011 Apple Computer Inc. All rights reserved.
//

#import "GDParticleStarfield.h"
#import "cocos2d.h"
#import "GDUtilities.h"

#define DEFAULT_HOW_MANY 200

@implementation GDParticleStarfield

+ (GDParticleStarfield*) starfield
{
    return [[[self alloc] init] autorelease];
}

- (id) init
{
    self = [self initWithTotalParticles:DEFAULT_HOW_MANY];
    
    return self;
}

- (id) initWithEffectDictionary:(NSDictionary*)inDict
{
    int howMany = [[inDict valueForKey:@"howMany"] intValue];
    if (!howMany)
    {
        howMany = DEFAULT_HOW_MANY;
    }
    self = [self initWithTotalParticles:howMany];
    
    // startColor
    NSDictionary* aStartColorDict = [inDict objectForKey:@"startColor"];
    if (aStartColorDict)
    {
        self.startColor = dictToColor(aStartColorDict);
    }
    
    // endColor
    NSDictionary* aEndColorDict = [inDict objectForKey:@"endColor"];
    if (aEndColorDict)
    {
        self.endColor = dictToColor(aEndColorDict);
    }
    
    // speed
    float aSpeed = [[inDict objectForKey:@"speed"] floatValue];
    if (aSpeed)
    {
        self.speed = aSpeed;
    }
    // startSize
    float aStartSize = [[inDict objectForKey:@"startSize"] floatValue];
    if (aStartSize)
    {
        self.startSize = aStartSize;
    }
    // endSize
    float aEndSize = [[inDict objectForKey:@"endSize"] floatValue];
    if (aEndSize)
    {
        self.endSize = aEndSize;
    }
    return self;
}


- (id) initWithTotalParticles:(NSUInteger)numberOfParticles
{
    if ((self = [super initWithTotalParticles:numberOfParticles]))
    {
        [self setTexture:[[CCTextureCache sharedTextureCache] addImage:@"stars.png"]];
        [self setSpeed:72.0];
        [self setSpeedVar:30.0];
                
        ccColor4F aStartColor = {0.82, 0.82, 1.0, 0.0};
        ccColor4F aEndColor = {1.0, 0.5, 0.5, 1.0};
        [self setStartColor:aStartColor];
        [self setEndColor:aEndColor];
        self.angle = 90.0;
        self.angleVar = 360.0;
        self.life = 4.0;
        self.lifeVar = 0.85;
        self.emissionRate = self.totalParticles/self.life;
        self.startSize = 4.0f;
		self.startSizeVar = 2.0f;
        self.endSize = 15.0f;
        self.endSizeVar = 4.0f;
        //spin
        self.startSpin = 0.0f;
        self.startSpinVar = 30.0;
        self.endSpin = 0.0;
        self.endSpinVar = 30.0;
        
        self.radialAccel = 100.0;
        self.radialAccelVar = 25.0;
        CGSize size = [[CCDirector sharedDirector] winSize];
        self.position = ccp(size.width / 2, size.height / 2.0);
    }
    return self;
}

@end
