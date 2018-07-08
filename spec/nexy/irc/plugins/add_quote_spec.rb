require 'nexy/irc/plugins'

RSpec.describe Nexy::Irc::Plugins::AddQuote do
  include Cinch::Test

  let(:bot)    { make_bot(described_class) }
  let(:plugin) { bot.plugins.first }
  describe 'command pattern' do
    subject { make_message(bot, message) }

    context 'matches !addquote hello world' do
      let(:message) { '!addquote hello world' }
      it { expect(subject.message).to eq '!addquote hello world' }
    end
  end

  describe 'command execution' do

  end
end
