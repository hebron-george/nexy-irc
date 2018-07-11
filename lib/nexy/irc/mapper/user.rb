module Nexy::Irc::Mapper
  class User
    attr_reader :channels, :user

    def initialize(user)
      @user     = user
      @channels = channels_user_is_in
    end

    private

    def channels_user_is_in
      user.channels
    end
  end
end