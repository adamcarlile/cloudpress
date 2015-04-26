# Cloudpress

Who needs Wordpress when you can use CLOUDPRESS!

## What?

Cloudpress is a blogging engine that publishes metadown files from Dropbox. It's designed as a fire and forget blogging solution, if you can write a metadown/markdown file then you can publish it without doing anything more than just placing it in a directory on Dropbox.

It's designed to be included within a Rails 3.1+ application, and provides a multitude of hooks for you to build your own templates around it.

## Requirements

  - Rails 3.1+
  - PostgreSQL database
  - Dropbox Account

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cloudpress'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cloudpress

After that, you will want to copy the migrations into the application
  
    $ rake cloudpress:install:migrations

And then run the initializer generator, which will ask you to fill in the application ID, log in to dropbox and authorize the application, and then enter the token you're provided with and then write them all in to `config/initializers/cloudpress.rb` you may want to replace them with ENV variables instead of hardcoding them.

    $ rails g cloudpress:initializer

The application ID is `7i1ku4x291czftv` which points to a dropbox application that I've made. If you'd like to create your own, just go ahead and replace that ID with your own applications.

After you've done that you can run your initial import.
    
    $ rake cloudpress:update


## Configuration

```ruby
config.app_key         # The application ID, as explained above
config.app_secret      # The app secret, populated by the installer
config.app_token       # The token you pasted in from the installtion
config.base_path       # The path in your dropbox that's considered root
config.live_path       # Where your live files will live under the base_path
config.draft_path      # Draft file location, under the base_path
config.draft_user      # Username for draft HTTP auth, leave as nil for no auth
config.draft_password  # Password for draft HTTP auth, leave as nil for no auth
```

## Usage

Cloudpress provides the majority of it's functionality through view helper renderers that you can move around and change to fit with your HTML structure.

You can see examples of these within the `views/cloudpress/*` folder, again all of these partial templates can be overriden within your application by adding a `views/cloudpress/*` directory.

## Adding Posts

Cloudpress, by default will look in a `cloudpress` directory in the root of your Dropbox. Inside it will create two folders on the first update, `live` and `draft` folders. Cloudpress will search these directories recursivly, so you can use whatever organisational structure suits. I tend just to stick with years, since I don't write enough blog posts!

You then just create a `metadown` file with a `md` extension, that reads like this:

```
---
title: The Rails renderer pattern
publish_date: 24/04/2015 10:30AM
tags:
- Ruby
- Ruby on rails
- Renderers
- Views
---
## Development
So this is the content...
```

The first part of the file contains metadata about the post, the second the actual content, all markdown is supported, and uses pygments for code block highighting

## Updating

I've got this deployed on Heroku, with a scheduled job to run every 10 mins using the provided rake task, or you can do it programatically by booting a console and typing `Cloudpress.update!`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cloudpress/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
