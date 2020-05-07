## Bookmark Manager ##

https://github.com/collier-jo/bookmark_manager

# Weekly Focus#

Main focuses for this week
Agile and TDD
Engineering and 'Dev Recipes'
Databases
Tooling


# The project #

You're going to build a bookmark manager. A bookmark manager is a website to maintain a collection of bookmarks (URLs). You can use it to save a webpage you found useful. You can add tags to the webpages you saved to find them later. You can browse bookmarks other users have added. You can comment on the bookmarks.


# specifications: #

Show a list of bookmarks
Add new bookmarks
Delete bookmarks
Update bookmarks
Comment on bookmarks
Tag bookmarks into categories
Filter bookmarks by tag
Users are restricted to manage only their own bookmarks

# User Stories #


As a <Stakeholder>,
So that <Motivation>,
I'd like <Task>.

////

1. Show a list of bookmarks:

As the user,
So that I can view quickly all my bookmarks,
I'd like my bookmarks to show in a list

2. Add new bookmarks 🚧

As a user,
So that add new bookmarks,
I want add to the bookmarks list via a form.

As a user
So I can store bookmark data for later retrieval
I want to add a bookmark to Bookmark Manager

3.

# Domain Model #

Object      | Message
____________|_______________
(/homepage) |
bookmarks   | show list of bookmarks

homepage    | have button that directs to ALL

/bookmarks  | erb:views
            | Add form with submit button



database    | id / URL

////

# Database #

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager;
3. Create the database using the psql command CREATE DATABASE bookmark_manager_test;
3. Connect to the database using the pqsl command \c bookmark_manager;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql
3. Connect to the database using the pqsl command \c bookmark_manager_test;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql

5. ALTER the table in database in psql - saved in file: db/migrations/02_add_title_to_bookmarks.sql


# PG #

# Test Environment and Production Environment #
