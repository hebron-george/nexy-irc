module Nexy::Irc::Mapper
  class User
    attr_reader :channels

    def initialize
      @channels = channels_user_is_in
    end

    private

    def channels_user_is_in
      raise NotImplementedError
    end
  end
end