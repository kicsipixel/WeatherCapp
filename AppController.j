/*
 * AppController.j
 * WeatherCapp
 *
 * Created by Szabolcs Toth on April 1, 2016.
 * Copyright 2016, purzelbaum.hu All rights reserved.
 */

@import <Foundation/Foundation.j>
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
    celsiusImage = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"celsius.svg"]];
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
                        image01d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"01d.svg"]];
                        [mainIcon setImage: image01d];
                        break;

                        case "01n":
                        image01n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"01n.svg"]];
                        [mainIcon setImage: image01n];
                        break;

                        case "02d":
                        image02d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"02d.svg"]];
                        [mainIcon setImage: image02d];
                        break;

                        case "02n":
                        image02n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"02n.svg"]];
                        [mainIcon setImage: image02n];
                        break;

                        case "03d":
                        image03d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"03d.svg"]];
                        [mainIcon setImage: image03d];
                        break;

                        case "03n":
                        image03n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"03n.svg"]];
                        [mainIcon setImage: image03n];
                        break;

                        case "04d":
                        image04d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"04d.svg"]];
                        [mainIcon setImage: image04d];
                        break;

                        case "04n":
                        image04n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"04n.svg"]];
                        [mainIcon setImage: image04n];
                        break;

                        case "09d":
                        image09d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"09d.svg"]];
                        [mainIcon setImage: image09d];
                        break;

                        case "09n":
                        image09n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"09n.svg"]];
                        [mainIcon setImage: image09n];
                        break;

                        case "10d":
                        image10d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"10d.svg"]];
                        [mainIcon setImage: image10d];
                        break;

                        case "10n":
                        image10n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"10n.svg"]];
                        [mainIcon setImage: image10n];
                        break;

                        case "11d":
                        image11d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"11d.svg"]];
                        [mainIcon setImage: image11d];
                        break;

                        case "11n":
                        image11n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"11n.svg"]];
                        [mainIcon setImage: image11n];
                        break;

                        case "13d":
                        image13d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"13d.svg"]];
                        [mainIcon setImage: image13d];
                        break;

                        case "13n":
                        image13n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"13n.svg"]];
                        [mainIcon setImage: image13n];
                        break;

                        case "50d":
                        image50d = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"50d.svg"]];
                        [mainIcon setImage: image50d];
                        break;

                        case "50n":
                        image50n = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"50n.svg"]];
                        [mainIcon setImage: image50n];
                        break;

                        deafult: 
                        imageDefault = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"default.svg"]];
                        [mainIcon setImage: imageDefault];
                    }
}

@end
