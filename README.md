== README

# Learnable shit

### About the App

Built in Rails/PostGreSQL.

### Setup

* clone down the app: `git clone https://github.com/alpha-tango/OutTeach.git`
* set up the database: `rake db:setup`
* you're all set!


### For setting up admin or instructor !

admins and isntructors can only add the courses !

by default any registrant is a member !

in console : "rails db" to open db access terminal

execute the following :

update users set role = 'admin'/'instructor' where email='<needed>';

this will change the permissions

# base adapted from

https://github.com/alpha-tango/OutTeach

