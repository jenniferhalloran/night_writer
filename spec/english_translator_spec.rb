require "./lib/english_translator.rb"

RSpec.describe Translator do
  let(:english_translator) {EnglishTranslator.new}

  it "exists" do
    expect(english_translator).to be_a(EnglishTranslator)
  end
end
