## Project title
A small bookmark manager web application with a database.

## Motivation
A project to test the ability to pair program, TDD, OOD, in the web environment. Building an understanding of http request-response cycles, and MVC, with persistence in a database.

## Build status
[![Build Status](https://travis-ci.com/chriswhitehouse/bookmark_manager.svg?branch=main)](https://travis-ci.com/chriswhitehouse/bookmark_manager)

## Code style
[![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/testdouble/standard)

## Screenshots
Include logo/demo screenshot etc.

## Tech/framework used
Ruby, Sinatra web framework with a PostgreSQL datasbase. With Rspec unit testing and Capybara feature tests.

## Features
### User Stories
#### User Story 1
```
As a User
So that I can keep track of my bookmarks
I want to be able to see a list of bookmarks
```
![US1 Domain Diagram](https://github.com/chriswhitehouse/bookmark_manager/blob/main/diagrams/user_story_1_diagram.svg)
#### User Story 2
```
As a user
So that I can record a bookmark for later use
I want to be able to add a bookmark to my list of bookmarks
```
![US2 Domain Diagram](https://github.com/chriswhitehouse/bookmark_manager/blob/main/diagrams/user_story_2_diagram.svg)
|Class | Bookmark |
|---|---|
|Properties | id, title, url|
|Actions| .all, .create |
#### User Story 3
```
As a user
So I can remove my bookmark from Bookmark Manager
I want to delete a bookmark
```
|Class | Bookmark |
|---|---|
|Properties | id, title, url|
|Actions| .all, .delete |
#### User Story 4
```
As a user
So I can change a bookmark in Bookmark Manager
I want to update a bookmark
```
|Class | Bookmark |
|---|---|
|Properties | id, title, url|
|Actions| .all, .find, .update|
#### User Story 5
```
A a user
So I can record why the bookmark is interesting
I want to be able to add comments to a bookmark
```
|Class | Comment |
|---|---|
|Properties | id, text, bookmark_id|
|Actions| .where, .create|

#### User Story 6
```
A a user
So I can group bookmarks
I want to be able to tag bookmarks
```
|Class | Tag |
|---|---|
|Properties | id, content|
|Actions| .where, .create|

## Code Example
Show what the library does as concisely as possible, developers should be able to figure out **how** your project solves their problem by looking at the code example. Make sure the API you are showing off is obvious, and that your code is short and concise.

## Installation
Provide step by step series of examples and explanations about how to get a development env running.

### Database Setup

1. Connect to psql
2. Create a development database using the psql command `CREATE DATABASE bookmark_manager`;
3. Create a test database using the psql command `CREATE DATABASE bookmark_manager_test`
3. Connect to the database using the psql command `\c bookmark_manager`;
4. Run the query we have saved in the file '01_create_bookmarks_table.sql'
5. Run the query we have saved in the file '02_add_title_to_bookmarks.sql'
6. Run the query we have saved in the file '03_create_comments_table.sql'
7. Run the query we have saved in the file '04_create_tags_table.sql'
8. Run the query we have saved in the file '05
_create_bookmarks_tags_table.sql'
9. Repeat steps 4 to 6 for the test database.

## API Reference

Depending on the size of the project, if it is small and simple enough the reference docs can be added to the README. For medium size to larger projects it is important to at least provide a link to where the API reference docs live.

## Tests
Describe and show how to run the tests with code examples.

## How to use?
If people like your project they’ll want to learn how they can use it. To do so include step by step guide to use your project.

## Contribute

Let people know how they can contribute into your project. A [contributing guideline](https://github.com/zulip/zulip-electron/blob/master/CONTRIBUTING.md) will be a big plus.

## Credits
Give proper credits. This could be a link to any repo which inspired you to build this project, any blogposts or links to people who contrbuted in this project.

#### Anything else that seems useful

## License
A short snippet describing the license (MIT, Apache etc)

MIT © [Yourname]()
