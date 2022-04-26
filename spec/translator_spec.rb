require 'simplecov'
SimpleCov.start
require './lib/braille_translator.rb'
require './lib/translator.rb'

RSpec.describe Translator do
  let(:translator) {Translator.new}
  let(:braille_translator) {BrailleTranslator.new}


  it "exists" do
    expect(translator).to be_a(Translator)
  end

  it "can translate braille and english" do
    expect(translator.translate_letter("a", translator.braille_translations)).to eq(["O.", "..", ".."])
    expect(translator.translate_letter(["O.", "..", ".."], braille_translator.english_translations)).to eq("a")
  end

  it "can translate braille and english messages" do
    hello_in_braille = [["O.", "OO", ".."], ["O.", ".O", ".."],
                        ["O.", "O.", "O."], ["O.", "O.", "O."],
                        ["O.", ".O", "O."]]
    expect(translator.translate_message(["h", "e", "l", "l", "o"], translator.braille_translations)).to eq(hello_in_braille)
    expect(translator.translate_message(hello_in_braille, braille_translator.english_translations)).to eq(["h", "e", "l", "l", "o"])
  end

end
