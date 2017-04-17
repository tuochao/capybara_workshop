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
if you met some issue like below
```
Errno::EACCES: Permission denied @ rb_sysopen - /Users/lqi/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/nokogiri-1.7.1/.autotest
Using rack-test 0.6.3
Using childprocess 0.6.3
An error occurred while installing nokogiri (1.7.1), and Bundler cannot continue.
Make sure that `gem install nokogiri -v '1.7.1'` succeeds before bundling.
```
- first install xcode-select
```
$ xcode-select --install
```

- second install nokogiri
```
$ sudo gem install nokogiri -v '1.7.1'
```
- third run bundle install again
```
$ bundle install
```
