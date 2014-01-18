Corona-SQLite-Database-Creator-Maintainer
=========================================

Sample project to create/maintain a sqlite db, tables, columns 

This project allows you to have a lua table that defines your db schema for the purpose of creating and 
maintaining a sqlite db in the resource directory of your app. 

If your app requires the use of a sqlite db, you must use the resource directory for this but getting the db
there initially is not easy and when you have updates to the schema it is even more difficult to maintain the existing
data while adding new columns / tables etc... This will allow you to define the schema and the code will take care of creating
the db/tables/columns for you.

Currently will only add new objects (tables/columns/indexes) but will not delete nor update items
x