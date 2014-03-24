##Description

This gem provides *nix systems `tail` command functionality for your Rails application.
If something goes wrong you don't have to ssh to your server anymore. Now you have normal scroll and search in browser instead of `nano`, `eamacs`, `vim`, `mcedit` - name it

Also it highlights with red any log stings which include query you've entered.

![How it works](how_it_works.gif)


##Installation

Just include it into your Gemfile

    gem 'tail'

run `bundle install` and mount it at your `config/routes.rb` like this:

    mount Tail::Engine, at: "/tail"

After this, you will see all your .log files available at /tail path.

Of course, you can mount it `at: "/whatevername"` you like.

If you use Devise for authentication, gem will use it also.

##License

This gem uses MIT-LICENSE. Fork it or create pull request. Any contribution is appreciated.
