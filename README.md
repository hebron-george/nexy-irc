# Nexy::Irc
Just a thing doing a thing.

## Getting Started
```shell
# If you want to use custom configurations
# create a config file for yourself by 
# copying the template that's provided
cp config/bot.yml.template config/bot.yml

# Open the `config/bot.yml` in a text editor
# and you can set the following custom values:
#   - server     # What server to connect to e.g. irc.freenode.net
#   - port       # What port to use e.g. 6667
#   - channels   # The channels you want the bot to join when it starts
#   - nick       # Bot nickname to the network
#   - realname   # Bot real name to the network
#   - user       # Bot username to the network
#   - ssl        # true or false, to connect to the server using SSL
```

You can start the bot with the following command:
```shell
bin/start
```

## Development -- Getting Started
You can start the bot in a console with the following:

```shell
git clone git@github.com:hebron-george/nexy-irc.git
cd nexy-irc/
bin/setup # sets up everything for you

# To run it locally in a console:
bin/console  
```

Once the console is loaded:

```ruby                                                  
[1] pry(main)> Nexy::Irc::Bot.new.start
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/nexy-irc.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
