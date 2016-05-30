# Lunch Roulette On Slack

Lunch Roulette is a Slack App with slash commands that allow users to generate random groups of 4 (based off whatever user groups you wish to include), enter in dietary restrictions/favorite foods for every slack user, and the ability to find restaurants in the area that match the food preferences of the group.

## How To Use Lunch Roulette


![lunch-roulette](http://g.recordit.co/1Lnap12tBy.gif)

To generate random groups of 4, you simply type in `/lunch-roulette` and the groups will appear.

![food-preferences](http://g.recordit.co/cDTpnpgZMD.gif)

There are 3 slash commands for individual food preferences

* `/food-prefs #add <food preference>` will add that food preference to the user's food preference database.
* `/food-prefs #delete <food preference>` will remove that food preference from the user's food preference database.
* `/food-prefs #list` will show all the food preferences for that particular user

![restaurant-recs](http://g.recordit.co/XiY7mtJkVp.gif)

There are two ways to find restaurant recommendations in your area.

* `/restaurant-recs` will bring the user back 10 restaurant recommendations based on the user's personal food preferences.
* `/restaurant-recs @username1 @username2` will bring the user back restaurant recommendations based on the user and other users personal food preferences. You can add as many usernames as you want after `/restaurant-recs`.


## Features and Improvements To Be Completed Next

* Upgrading to multitenancy and allowing other slack teams to use it.
* Allowing the input of multiple locations
* More dynamic lunch roulette grouping
* Setting up private channels for lunch roulette groups

## Problems?

Log an issue on this repo! Lunch Roulette is Open Source and maintained by Nicholas Dorans.

##### Contributors are Welcome! Fork the Repo, Create a new Branch, and Submit a PR!

#### LICENSE

(The MIT License)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
