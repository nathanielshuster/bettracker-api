## BetTracker

American sports odds application backend, built with Rails and PostgreSQL.

## Project Status

Finished and operational at the moment.

## Installation and Setup Instructions

Clone down this repository. You will need `rails` and `bundler` installed globally on your machine.  

Installation:

`bundle install`  

To Start Server:

`rails s -p 4000` (Make sure port is different from frontend port)

## Reflection

I began this project while I was a student at Flatiron School. I had a bit of experience building rails api's and I wanted to ensure that I built a much more sophisticated version than I previously had.

My original idea was to create an application geared towards bookkeepers, with the ability to add events and players that are placing bets and then transfer money after the event outcome. I still believe that is a great idea and I believe I can expand this application into that but money transfers seemed a bit intimidating, so I decided to build BetTracker, which seems much more practical.

One of the main challenges I ran into was using JWT and PostgreSQL for the first time. I had a bit of experience with them but nothing on this scale. At the time of this writing I can confidently say I have a thorough understanding of JWT and PostgreSQL.

The technologies implemented in this project are Rails, JWT, PostgreSQL and bcrypt. In the future I plan to refine the controllers and make them more secure. Also, I would like to fix some small bugs that I have noticed. I am sure than in time I can use this project as a starting point for my initial idea of making a bookkeeping application.
