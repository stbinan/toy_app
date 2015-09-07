# My rails toy <3

## README

This app is almost developed according to Michael Hartl's Rails Tutorial 3rd Edition, it can be read free at https://www.railstutorial.org.

### Ruby version
2.2.2

### System dependencies and major changes
1. This app uses paperclip instead as avatar and image upload tool, it needs imagemagick as dependency, for more information check https://github.com/thoughtbot/paperclip & from search engine.

2. This app uses puma as website server, for how to set it up, or alternatives, check https://wiki.archlinux.org/index.php/Ruby_on_Rails#Application_servers & from search engine.

3. Chaptor 10 Account Activation and Password Reset doesn't merge to the main stream, check the branch if you need it.

### Configuration
1. First you may want to add your own admin account, check file db/seeds.rb.

2. The gem source in Gemfile is a mirror from China, you may want to change it.

3. Then before run the app, you need to do command below under the app folder
 `$ bundle install`
 `$ bundle exec rake db:setup`
 `$ bundle exec rake db:seed`

4. Finally, set up the server or just run it with `$ rails server`.

For other problems please check the websites above or leave me a message on twitter @stbinan.

