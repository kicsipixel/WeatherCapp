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
    @outlet CPImageView celsiusIcon;
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
    CPImage             celsiusImage;
    WeatherAPI         weatherAPI;
}

- (id)init
{
    if (self = [super init]);
    {
        image01d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"01d.svg"]];
        image01n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"01n.svg"]];
        image02d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"02d.svg"]];
        image02n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"02n.svg"]];
        image03d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"03d.svg"]];
        image03n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"03n.svg"]];
        image04d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"04d.svg"]];
        image04n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"04n.svg"]];
        image09d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"09d.svg"]];
        image09n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"09n.svg"]];
        image10d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"10d.svg"]];
        image10n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"10n.svg"]];
        image11d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"11d.svg"]];
        image11n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"11n.svg"]];
        image13d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"13d.svg"]];
        image13n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"13n.svg"]];
        image50d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"50d.svg"]];
        image50n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"50n.svg"]];
        celsiusImage = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"celsius.svg"]];
        imageDefault = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"default.svg"]];
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
    [tempLabel setStringValue: temperature.toFixed(0) + " C"];
    [celsiusIcon setImage: celsiusImage];

    var  windImage = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"wind.svg"]];
    [windIcon setImage: windImage];
    [windLabel setStringValue: [[aNotification object] objectForKey: "Wind"] + "km/h" ];

    var dropImage = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"drop.svg"]];
    [dropIcon setImage: dropImage];
    [humidityLabel setStringValue: [[aNotification object] objectForKey: "Humidity"] + "%"];

    switch ([[aNotification object] objectForKey: "Icon"])
                    {
                        case "01d":
                        [mainIcon setImage: image01d];
                        break;

                        case "01n":
                        [mainIcon setImage: image01n];
                        break;

                        case "02d":
                        [mainIcon setImage: image02d];
                        break;

                        case "02n":
                        [mainIcon setImage: image02n];
                        break;

                        case "03d":
                        [mainIcon setImage: image03d];
                        break;

                        case "03n":
                        [mainIcon setImage: image03n];
                        break;

                        case "04d":
                        [mainIcon setImage: image04d];
                        break;

                        case "04n":
                        [mainIcon setImage: image04n];
                        break;

                        case "09d":
                        [mainIcon setImage: image09d];
                        break;

                        case "09n":
                        [mainIcon setImage: image09n];
                        break;

                        case "10d":
                        [mainIcon setImage: image10d];
                        break;

                        case "10n":
                        [mainIcon setImage: image10n];
                        break;

                        case "11d":
                        [mainIcon setImage: image11d];
                        break;

                        case "11n":
                        [mainIcon setImage: image11n];
                        break;

                        case "10d":
                        [mainIcon setImage: image10d];
                        break;

                        case "10n":
                        [mainIcon setImage: image10n];
                        break;

                        case "11d":
                        [mainIcon setImage: image11d];
                        break;

                        case "11n":
                        [mainIcon setImage: image11n];
                        break;

                        case "13d":
                        [mainIcon setImage: image13d];
                        break;

                        case "13n":
                        [mainIcon setImage: image13n];
                        break;

                        case "50d":
                        [mainIcon setImage: image50d];
                        break;

                        case "50n":
                        [mainIcon setImage: image50n];
                        break;

                        deafult: [mainIcon setImage: imageDefault];
                    }
}

@end
