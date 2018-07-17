# Maps a channel
#   - Gets a list of all users in channel
#   - For each user, gets a list of channels they're in

module Nexy::Irc::Mapper
  class Channel
    attr_reader :channel, :map

    def initialize(channel)
      @channel = channel
    end

    def map
      @map ||= build_map!
    end

    def channel_count
      Hash.new(0).tap do |channel|
        map.each do |user, channels|
          channels.each { |c| channel[c] += 1 }
        end
      end
    end

    private

    def build_map!
      users = channel.users.keys # channel.users => {user: modes, user2: modes, ...}
      {}.tap do |channels_by_user|
        users.each do |user|
          channels_by_user[user] = user.channels
        end
      end
    end
  end
end