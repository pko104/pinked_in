http://pinked-in.herokuapp.com/

Nov 8, 2016
-Share post SASS completed
-Font Awesome Gem added
-Pushed to Heroku
-Had trouble precompiling SASS to asset pipeline but made a change to assets.rb

Nov 7, 2016
-Fixed logic with the networks, there was a bug with connections overriding one another
-Profile view css started

Nov 1, 2016
-Newsfeed animation and SASS

Oct 26, 2016
-Login page with rail error messages
-Login page design completed

Oct 18, 2016
-Front page design with SASS finished

Oct 12, 2016
-Continuation of LinkedIn Clone
-Due to changes in the LinkedIn website, must change landing page/loading page

February 3, 2015
-Started conceptualizing how LinkedIn works in order to recreate it using Ruby on Rails
-Used devise user for omniauth LinkedIn
-Created Migrations of Skills & Endorsements, Education, Following, Volunteering, Languages, Projects, Experience, Summary
-Conceptualized how to implement a network; using the has_many associations, if another belongs in the same network or first level network as the other they are pinked_in to each otehr
-Designed a Similar Webpage to LinkedIn
-![Screencast](http://i.imgur.com/EemXDLi.png)

February 4,2015
-Completely restarted the whole project had problems with not using an updated Devise model, had problems with moving the devise signup form within a different page
-Used an application helper to move around devise forms

February 5,2015
-Created a migration so that users may have a newsfeed similar to that on LinkedIn

February 6,2015
-Had problems with jQuery not saving data saying that it could not save because it was null, did not have a problem in other projects
-FIXED: had to JSON.stringify, confused why it needed to be used in this project and not my others, I was also advised that it was not needed as well.

February 7,2015
-Had problems with users not saving fixing with devise
-Silly error was that I was signed in the whole time and by signing up it would just bring me back to my profile page of current user
-Made it so that if you are signed in already it redirects to your profile page
-Added sign out link
-Changed passwords to 6 letter length

February 9, 2015
-Added a column to network connected_ids_array
-Implemented logic of each user owning their own network and others may "Pink In" (Join their network), which would append their user_id to a string, which is split in the controller into an array and then looped through with the Network.where and each object is then appended to a newsfeed array, which is used in the views to show all messages that those who are connected can see.

February 11, 2015
-Fixed issue where only one user can be connected to another, now multiple users can be connected to each other
-I had two loops running separately so the posts were not ordered in the newsfeed, so I pushed all the elements of both loops into one array and sorted by DESC order
