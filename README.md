== README

# Learnable shit

### About the App

Built in Rails/PostGreSQL.

### Heroku Instance 

http://learnableooad.herokuapp.com/

admin-user : admin@learnable.in	
instructor-user : instructor@learnable.in
member-user: member@learnable.in

password-for-all : priyanka


### Setup

* install ruby on rails
* clone down the app: `git clone https://github.com/senthil-ramasamy/learnable.git`
* set up the database: `rake db:setup`
* you're all set!


### For setting up admin or instructor !

admins and isntructors can only add the courses !

by default any registrant is a member !

in console : "rails db" to open db access terminal

execute the following :

update users set role = 'admin'/'instructor' where email='<needed>';

this will change the permissions

#to do

certification 

discussion platform embed

blog extra

//update the list if u find anything

# base adapted from

https://github.com/alpha-tango/OutTeach

