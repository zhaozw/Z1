//
//  GDParticleFog.h
//  MenuTest
//
//  Created by Doug Whitmore on 7/4/11.
//  Copyright 2011 Apple Computer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDEffectProtocol.h"
#import "CCParticleExamples.h"

@interface GDParticleFog : CCParticleSun <GDEffectProtocol>
{
    
}

+ (GDParticleFog*) fog;

@end
