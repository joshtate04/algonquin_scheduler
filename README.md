# README #

## Setting this app up on your machine ##

### OS X ###
* Make sure you are running Ruby v2.2.1 (using ruby -v)
* Update if needed
```
#!bash
rvm install 2.2.1
```
* Install Node.js
```
#!bash
brew install node
```
* Using node, install Bower (Asset management system)
```
#!bash
npm install bower -g
```
* Go to project directory and install needed gems
```
#!bash
gem install bundler # Bundler may or may not be installed already if you updated, so run this to be safe
bundle install
```
* Install bower assets (defined by bower.json file in project)
```
#!bash
rake bower:install
```
* Copy then update your database.yml config file
```
#!bash
cp config/database_COPY.yml config/database.yml
```
* Change login info for MySQL (note: My system requires a different socket through MAMP, depending on how you have MySQL installed, this will probably be different and the socket variable can probably be removed)
* Create and migrate database
```
#!bash
rake db:create
rake db:migrate
```
* Run Rails server
```
#!bash
rails s
# FOR DAEMONIZED SERVER (WHICH FREES UP THE COMMAND LINE)
rails s -d
```
* Open browser and go to localhost:3000

### LINUX ###
* Make sure you are running Ruby v2.2.1 (using ruby -v)
* Update if needed
```
#!bash
rvm install 2.2.1
```
* Install Node.js and Node Package Manager
```
#!bash
apt-get update
apt-get install nodejs
apt-get install npm
```
* Using node, install Bower (Asset management system)
```
#!bash
npm install bower -g
```
* Go to project directory and install needed gems
```
#!bash
gem install bundler # Bundler may or may not be installed already if you updated, so run this to be safe
bundle install
```
* Install bower assets (defined by bower.json file in project)
```
#!bash
rake bower:install
```
* Copy then update your database.yml config file
```
#!bash
cp config/database_COPY.yml config/database.yml
```
* Change login info for MySQL (note: Amanda and Mannat can probably just remove the socket lines entirely, as the default will work)
* Create and migrate database
```
#!bash
rake db:create
rake db:migrate
```
* Run Rails server
```
#!bash
rails s
# FOR DAEMONIZED SERVER (WHICH FREES UP THE COMMAND LINE)
rails s -d
```
* Open browser and go to localhost:3000