//
//  Asset.m
//  Ch14_12
//
//  Created by Ho Mark on 12/6/16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Asset.h"

@implementation Asset
@synthesize name;
@synthesize euro;
@synthesize usd;

-(id) initWithName:(NSString*) p_name 
            AndUsd:(float) p_usd 
           AndEuro:(float) p_euro {
  self = [super init];
  if (self) {
    name = p_name;
    usd = p_usd;
    euro = p_euro;   
  }
  return self;
}
@end
