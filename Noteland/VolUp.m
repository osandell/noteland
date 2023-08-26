#import "VolUp.h"
#import <Cocoa/Cocoa.h>

@implementation VolUpCommand

- (id)performDefaultImplementation {
    NSLog(@"Sending media volume up key press");

    [self HIDPostAuxKey:0]; // NX_KEYTYPE_SOUND_UP

    return nil;
}

- (void)HIDPostAuxKey:(UInt32)key {
    [self doKey:true withKey:key];
    [self doKey:false withKey:key];
}

- (void)doKey:(BOOL)down withKey:(UInt32)key {
    NSEventModifierFlags flags = down ? 0xa00 : 0xb00;
    int data1 = (key << 16) | (down ? 0xa00 : 0xb00);

    NSEvent *event = [NSEvent otherEventWithType:NSEventTypeSystemDefined
                                        location:NSMakePoint(0, 0)
                                   modifierFlags:flags
                                       timestamp:0
                                    windowNumber:0
                                         context:nil
                                         subtype:8
                                          data1:data1
                                          data2:-1];

    CGEventRef cgEvent = [event CGEvent];
    CGEventPost(kCGHIDEventTap, cgEvent);
}

@end

