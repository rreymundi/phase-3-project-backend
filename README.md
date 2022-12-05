# Phase 3 project: List.it

Lit.it is a personal task management tool that allows you to organize tasks via lists. 

This repo corresponds to the List.it API, which was set up using a Sinatra and [Active Record](https://guides.rubyonrails.org/active_record_basics.html).

## Getting started

Fork and clone this branch to set up your local copy of the back-end.

List.it makes use of a React frontend app to interact with the database via the API, for which a repo and instructions can be found [here](https://github.com/rreymundi/phase-3-project-frontend).

Run the following commands from this project's directory to get the back-end up and running.

### `bundle install`

Installs the required gems and dependencies.

### `bundle exec rake server`

Runs the server on port [http://localhost:9292](http://localhost:9292).

### `rake db:seed`

Runs the seeds.rb file to get you started with some seed data. Use `rake db:seed:replant` to clear any changes made to the data and re-plant the data from the seeds.rb file.

## Model associations

The database consists of two models with a one-to-many Active Record association:

- Lists
  - Has many *tasks*
- Tasks
  - Belongs to a *list*

Both models have full CRUD capabilities.

- Lists
  - Read all lists
  - Create a new list
  - Update a list name
  - Delete a list

- Tasks
  - Read all tasks
  - Create a new task
  - Update a task's name, description, "saved", and "checked" status.
  - Delete a task

The database tables were set up using Active Record [migrations](https://guides.rubyonrails.org/active_record_migrations.html#using-the-change-method). Any changes to the database should be done via Active Record migrations. The schema.rb file will contain the latest state of the database.

## Resources

- Use (Postman)[https://www.postman.com/downloads/] to test API endpoints.
- Use `binding.pry` to test models and debug server requests.

## Demo

Check out a demo of List.it [here](https://youtu.be/xhb5Ozqw3Hk).