# FictionBuzz
A twitter clone using Ruby on Rails.

Check it out at https://fiction-buzz.herokuapp.com/


Under construction :construction:

## Tech Stack Used 
* Rails 6
* MRI Ruby 2.7.1
* Databasse: postgres 12

## Running on local machine
* Fork the repo and clone it on your local system.
* Go to the project directory and run
```console
bundle install 
```
* Create the database and perform migration (Add your Postgres credentials in config/database.yml)
```console
rake db:create
rake db:migrate
```
* Start the server on localhost:3000 by running
```console
rails server 
```

## External Gems 
* [Bulma](https://github.com/jgthms/bulma)
* [Better Errors](https://github.com/BetterErrors/better_errors)
* [Guard](https://github.com/guard/guard)
* [Simple Form](https://github.com/heartcombo/simple_form)
