require 'nexy/irc/plugins'

RSpec.describe Nexy::Irc::Plugins::AddQuote do
  include Cinch::Test

  let(:bot)    { make_bot(described_class) }
  let(:plugin) { bot.plugins.first }
  describe 'for different messages' do
    subject { make_message(bot, message) }

    context 'good quote' do
      let(:message) { '!addquote hello world' }
      it 'gets added' do
        expect(subject.message).to eq '!addquote hello world'
        expect(get_replies(subject).first.text).to include 'Added new quote!'
      end
    end

    context 'bad quote' do
      let(:message) { '.!addquote will not match' }
      it 'does not get added' do
        expect(get_replies(subject)).to eq []
      end
    end
  end
end
