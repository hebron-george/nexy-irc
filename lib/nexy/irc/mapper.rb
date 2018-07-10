module Nexy::Irc
  module Mapper
    def map_user(user)
      raise NotImplementedError
    end

    def map_channel(channel)
      raise NotImplementedError
    end
  end
end

require_rel 'mapper/**/*.rb'