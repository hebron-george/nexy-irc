RSpec.describe Nexy::Irc::Bot do
  it "has a version number" do
    expect(Nexy::Irc::VERSION).not_to be nil
  end

  describe '#initialize' do
    let(:bot) { described_class.new }

    context '#initialize' do
      it 'will grab bot info from config and creates a new cinch bot' do
        require_rel '../../config/config'
        expect(Nexy::Irc::Config).to receive(:bot_config).and_call_original
        expect(Cinch::Bot).to receive(:new).and_call_original
        bot
      end
    end

    context '#start' do
      it 'will call start' do
        expect(bot.bot).to receive(:start)
        bot.start
      end
    end
  end
end
