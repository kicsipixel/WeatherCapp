/*
 * WeatherAPI.j
 * WeatherCapp
 *
 * Created by Szabolcs Toth on September 8, 2017.
 * Copyright 2017, purzelbaum.hu All rights reserved.
 */

@import <Foundation/CPObject.j>
@import <AppKit/AppKit.j>

@implementation WeatherAPI : CPObject
{
    CPMutableDictionary weatherDictionary;
}

- (void)getWeatherData
{
    weatherDictionary = [[CPMutableDictionary alloc]init];

    if ("geolocation" in navigator)
    {
    /* geolocation is available */
        navigator.geolocation.getCurrentPosition(function(position)
        {
            var latitude = position.coords.latitude,
                longitude =  position.coords.longitude;
  
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
                alert("No Invocation took place At All");
            }
        }

        function handler(evtXHR)
        {
            if (invocation.readyState == 4)
            {
                if (invocation.status == 200)
                {
                    var forecastInfo = JSON.parse(this.responseText);

                    // Convert tempreture string to float
                    var temperature = parseFloat(forecastInfo.main.temp);

                   [weatherDictionary setValue: forecastInfo.name forKey: "City"];
                   [weatherDictionary setValue: forecastInfo.sys.country forKey: "Country"];
                   [weatherDictionary setValue: temperature forKey: "Temperature"];
                   [weatherDictionary setValue: forecastInfo.main.humidity forKey: "Humidity"];
                   [weatherDictionary setValue: forecastInfo.wind.speed forKey: "Wind"];

                   [[CPNotificationCenter defaultCenter] postNotificationName: "WeatherDataReceived" object: weatherDictionary]
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