#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [GeneratedPluginRegistrant registerWithRegistry:self];

    FlutterViewController *flutterVC = (FlutterViewController *) (self.window.rootViewController);

    FlutterMethodChannel *flutterChannel = [FlutterMethodChannel methodChannelWithName:@"eric.flutter.io" binaryMessenger:flutterVC.binaryMessenger];

    [flutterChannel setMethodCallHandler:^(FlutterMethodCall *_Nonnull call, FlutterResult _Nonnull result){

    }];

    // Override point for customization after application launch.
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
