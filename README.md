#Stellar Shoes Management

This app is very useful for organizing your brands and keeping track of
brands carried in specific stores.

##Author

Jessica Hori

##Install

This app is used in connection with Sinatra and ActiveRecord. You do not have to run Rails.

Download or fork the repository and bundle in terminal in order to use the required gems and dependencies.


If you are starting from scratch you should first make an important folder:  'config' -- with a ```database.yml``` file inside it.

In your yml file will be :  

```ruby
development:
  adapter: postgresql
  database: shoe_store_development

test:
  adapter: postgresql
  database: shoe_store_test

```

Make sure those are lined up correctly. If you put the adapter and database words aligned to the left wall of the text editor, your database will only make the development database and ignore everything else under it.

Run ```rake db:create```

then:  ```rake db:test:prepare```

This will create the main and test databases.


In terminal we run:

```ruby

rake db:create_migration NAME=create_brands

```

Next we will run:

```ruby
rake db:create_migration NAME=create_venues

```

Lastly we will run:

```ruby

rake db:create_migration NAME=create_concerts

```

A db folder with a sub folder called ```migrate``` with migration files will automatically be created.


Check the repository files for more information on what to insert in those files, lib folder, spec set up, Rakefile, Gemfile,and views.


After you have completed those run:

```ruby

rake db:migrate

```

 and


```ruby

rake db:test:prepare

```


This will update your test database for specs. You should always update your test database after creating a new migration and adding in new specs.



##License

GNU GPL v.2.0

Free to copy and improve via fork and pull requests.

If you would like to improve and add more features and functionality, check my user stories which could be continued from where I left off.


##User Stories


1. As a customer, I want to be able to see what shoes are carried in the stores.
2. As a customer, I want to be able to see what sizes are carried for the shoes.
3. As a customer, I want to be able to see what colors are carried for the shoes.
4. As a shoe store "manager" or "cashier", I want to be able to choose shoes and checkout for a customer. A shoe can only be purchased once. A purchase can have many shoes.
5. As a shoe store "manager" or "cashier", I want to be able to see what date the shoe was purchased.


These might be features which to add in the shoe class and shoes table in the database. I need a purchased_date field, color, and size column at least. 
