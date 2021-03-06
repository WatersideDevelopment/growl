//
//  GrowlGNTPKeyController.m
//  Growl
//
//  Created by Rudy Richter on 10/10/09.
//  Copyright 2009 The Growl Project. All rights reserved.
//

#import "GrowlGNTPKeyController.h"
#import "GNTPKey.h"

@implementation GrowlGNTPKeyController

+ (GrowlGNTPKeyController *)sharedInstance {
    static GrowlGNTPKeyController *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (id) init {
	if ((self = [super init])) 
	{
		_storage = [[NSMutableDictionary alloc] init];
	}
	return self;
}

- (void)removeKeyForUUID:(NSString*)uuid
{
   [_storage removeObjectForKey:uuid];
}

- (void)setKey:(GNTPKey*)key forUUID:(NSString*)uuid
{
	[_storage setValue:key forKey:uuid];
}

- (GNTPKey*)keyForUUID:(NSString*)uuid
{
	return [_storage valueForKey:uuid];
}

@end
