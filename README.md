### User Stories
```
As a User
So that I can keep track of my bookmarks
I want to be able to see a list of bookmarks
```

```
As a user
So that I can record a bookmark for later use
I want to be able to add a bookmark to my list of bookmarks
```

```
As a user
So I can remove my bookmark from Bookmark Manager
I want to delete a bookmark
```

```
As a user
So I can change a bookmark in Bookmark Bookmark Manager
I want to update a bookmark
```

### Domain Model
User Story 1 Diagram:

![US1 Domain Diagram](https://github.com/chriswhitehouse/bookmark_manager/blob/main/diagrams/user_story_1_diagram.svg)

User Story 2 Diagram:

![US2 Domain Diagram](https://github.com/chriswhitehouse/bookmark_manager/blob/main/diagrams/user_story_2_diagram.svg)

* Objects: user, bookmark, bookmark(list)

* Properties: name, url,

* Methods: see_list

|Class | Bookmark |
|---|---|
|Properties | id, title, url|
|Actions| .all, .create, .delete, .find, .update|

### Database Setup

1. Connect to psql
2. Create a development database using the psql command `CREATE DATABASE bookmark_manager`;
3. Connect to the database using the psql command `\c bookmark_manager`;
4. Run the query we have saved in the file '01_create_bookmarks_table.sql'
5. Create a test database using the psql command `CREATE DATABASE bookmark_manager_test`
6. Repeat steps 3 and 4 for the test database.
7. Alter the each of the tables to add a column, by running the query we have saved in '02_add_title_to_bookmarks.sql'
