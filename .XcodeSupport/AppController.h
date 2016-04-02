#import <Cocoa/Cocoa.h>
#import "xcc_general_include.h"

@interface AppController : NSObject

@property (assign) IBOutlet NSWindow* theWindow;
@property (assign) IBOutlet NSTextField* cityLabel;
@property (assign) IBOutlet NSTextField* tempLabel;
@property (assign) IBOutlet NSImageView* mainIcon;
@property (assign) IBOutlet NSImageView* dropIcon;
@property (assign) IBOutlet NSImageView* windIcon;
@property (assign) IBOutlet NSTextField* humidityLabel;
@property (assign) IBOutlet NSTextField* windLabel;

@end
