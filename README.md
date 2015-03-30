# SANDBOX TEST PROJECT

    $ cp config/database.yml.example config/database.yml
    $ bundle install
    $ bundle install --without production - without production gems
    $ bundle exec rake db:migrate
    $ bundle exec rake db:test:prepare
    $ bundle exec rspec spec/

If the tests don't pass, it means there may be something wrong with your system. If they do pass, then you can debug your code by comparing it with the reference implementation.

GIT

	$ git remote add origin https://github.com/<username>/<app_name>.git
	$ git push -u origin master

	$ git add .
	$ git commit -m "Initialize repository"
	$ git push

	$ git pull - pull repository to server

Create a new repository on the command line

touch README.md

	$ git init
	$ git add README.md
	$ git commit -m "first commit"
	$ git remote add origin https://github.com/AlexandrBasan/rubyonrails.git
	$ git push -u origin master
	
Push an existing repository from the command line

	$ git remote add origin https://github.com/AlexandrBasan/rubyonrails.git
	$ git push -u origin master


Heroku

    $ rake assets:precompile
    $ RAILS_ENV=production bundle exec rake assets:precompile
    $ git push heroku master
    $ heroku rake db:migrate
    $ heroku restart
    $ heroku open


After Update Ruby

    $ rvm use 2.1.5
    $ bundle install
    $ bundle install --without production
    $ gem install heroku
    

