/*
 * AppController.j
 * WeatherCapp
 *
 * Created by Szabolcs Toth on April 1, 2016.
 * Copyright 2016, purzelbaum.hu All rights reserved.
 */

@import <Foundation/CPObject.j>
@import <AppKit/AppKit.j>
@import "WeatherAPI.j"

@implementation AppController : CPObject
{
    @outlet CPWindow    theWindow;
    @outlet CPTextField cityLabel;
    @outlet CPTextField tempLabel;
    @outlet CPImageView mainIcon;
    @outlet CPImageView dropIcon;
    @outlet CPImageView windIcon;
    @outlet CPTextField humidityLabel;
    @outlet CPTextField windLabel;
    CPImage             image01d;
    CPImage             image01n;
    CPImage             image02d;
    CPImage             image02n;
    CPImage             image03d;
    CPImage             image03n;
    CPImage             image04d;
    CPImage             image04n;
    CPImage             image09d;
    CPImage             image09n;
    CPImage             image10d;
    CPImage             image10n;
    CPImage             image11d;
    CPImage             image11n;
    CPImage             image13d;
    CPImage             image13n;
    CPImage             image50d;
    CPImage             image50n;
    CPImage             imageDefault;
    WeatherAPI         weatherAPI;
}

- (id)init
{
    if (self = [super init]);
    {
        image01d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"01d.png"] size:CGSizeMake(120, 120)];
        image01n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"01n.png"] size:CGSizeMake(120, 120)];
        image02d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"02d.png"] size:CGSizeMake(120, 120)];
        image02n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"02n.png"] size:CGSizeMake(120, 120)];
        image03d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"03d.png"] size:CGSizeMake(120, 120)];
        image03n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"03n.png"] size:CGSizeMake(120, 120)];
        image04d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"04d.png"] size:CGSizeMake(120, 120)];
        image04n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"04n.png"] size:CGSizeMake(120, 120)];
        image09d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"09d.png"] size:CGSizeMake(120, 120)];
        image09n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"09n.png"] size:CGSizeMake(120, 120)];
        image10d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"10d.png"] size:CGSizeMake(120, 120)];
        image10n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"10n.png"] size:CGSizeMake(120, 120)];
        image11d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"11d.png"] size:CGSizeMake(120, 120)];
        image11n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"11n.png"] size:CGSizeMake(120, 120)];
        image13d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"13d.png"] size:CGSizeMake(120, 120)];
        image13n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"13n.png"] size:CGSizeMake(120, 120)];
        image50d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"50d.png"] size:CGSizeMake(120, 120)];
        image50n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"50n.png"] size:CGSizeMake(120, 120)];
        imageDefault = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"deafult.png"] size:CGSizeMake(120, 120)];
       [[CPNotificationCenter defaultCenter] addObserver:self selector: @selector(buildUI:) name: "WeatherDataReceived" object: nil];

        weatherAPI = [[WeatherAPI alloc]init];
        [weatherAPI getWeatherData];
    }
    return self;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
}

- (void)awakeFromCib
{
    [theWindow setFullPlatformWindow:NO];

}

- (void)buildUI:(CPNotification)aNotification
{
    [cityLabel setStringValue: [[aNotification object] objectForKey: "City"]+ ", " + [[aNotification object] objectForKey: "Country"]];
    var temperature = [[aNotification object] objectForKey: "Temperature"];
    [tempLabel setStringValue: temperature.toFixed(0)];

    var  windImage = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"wind.png"]];
    [windIcon setImage: windImage];
    [windLabel setStringValue: [[aNotification object] objectForKey: "Wind"]];

    var dropImage = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"drop.png"]];
    [dropIcon setImage: dropImage];
    [humidityLabel setStringValue: [[aNotification object] objectForKey: "Humidity"]];
}

@end
