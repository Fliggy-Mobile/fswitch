#import "FswitchPlugin.h"
#import <fswitch/fswitch-Swift.h>

@implementation FswitchPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFswitchPlugin registerWithRegistrar:registrar];
}
@end
