# capybara_workshop
## ruby env
### install brew

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
### install rbenv
```
$ brew update
$ brew install rbenv
```
### install ruby
```
# list all available versions:
$ rbenv install -l

# install a Ruby version:
$ rbenv install 2.2.2
# check already install ruby verison
$ rbenv vesions
```
### install bundler
```
$ gem install bundler

```
#### create and edit Gemfile
```
source 'https://rubygems.org'
gem 'capybara'
```
### run bundle install
```
$ bundle install
```
