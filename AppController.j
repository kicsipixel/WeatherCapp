/*
 * AppController.j
 * WeatherCapp
 *
 * Created by Szabolcs Toth on April 1, 2016.
 * Copyright 2016, purzelbaum.hu All rights reserved.
 */

@import <Foundation/CPObject.j>
@import <AppKit/AppKit.j>

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
    CPImage             dropImage;
    CPImage             windImage;
}

- (id)init
{
    self = [super init];
    if (self)
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
        dropImage = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"drop.png"] size:CGSizeMake(15.38, 20)];
        windImage = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"wind.png"]];
        imageDefault = [[CPImage alloc] initWithContentsOfFile:[[CPBundle mainBundle] pathForResource:@"default.png"] size:CGSizeMake(120, 120)];
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
    
    if ("geolocation" in navigator)
    {
    /* geolocation is available */
        navigator.geolocation.getCurrentPosition(function(position)
        {

            var latitude = position.coords.latitude,
                longitude =  position.coords.longitude;
            
            /* Test coordinates
            var latitude = 0,
                longitude = 0;
            */

            var invocation = new XMLHttpRequest(),
                url = 'http://api.openweathermap.org/data/2.5/weather?lat=' + latitude + '&lon=' + longitude +  '&APPID=7633665e60305d7e7a42a554052f88e2&units=metric';

        function callOtherDomain()
        {
            if (invocation)
            {
                invocation.open('GET', url, true);
                invocation.onreadystatechange = handler;
                invocation.send();
            }
            else
            {
                alert("No Invocation TookPlace At All");
            }
        }

        function handler(evtXHR)
        {
            if (invocation.readyState == 4)
            {
                if (invocation.status == 200)
                {
                    var forecastInfo = JSON.parse(this.responseText);
                    [cityLabel setStringValue: forecastInfo.name + ", " + forecastInfo.sys.country];
                    [tempLabel setStringValue: forecastInfo.main.temp + "˚C"];
                    [dropIcon setImage: dropImage];
                    [humidityLabel setStringValue: forecastInfo.main.humidity + "%"];
                    [windIcon setImage: windImage];
                    CPLog(this.responseText);
                    [windLabel setStringValue: forecastInfo.wind.speed + "km/h"]

                    switch (forecastInfo.weather[0].icon)
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
            else
                alert("Invocation Errors Occured");
            }
        }

        callOtherDomain();
            })
        }
    else
    {
    /* geolocation IS NOT available */
        alert("Your browser doesn't support geolocation.");
    }
}

@end
