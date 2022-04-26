require 'simplecov'
SimpleCov.start

require "./lib/braille_translator.rb"

RSpec.describe BrailleTranslator do
  let(:braille_translator) {BrailleTranslator.new}

  it "exists" do
    expect(braille_translator).to be_a(BrailleTranslator)
  end

  it "can format a braille message for translation" do
    unformatted_braille = "O.O.O.O.O.\nOO.OO.O..O\n....O.O.O.\n"
    expected_braille_letters =[[["O.", "OO", ".."],
                                ["O.", ".O", ".."],
                                ["O.", "O.", "O."],
                                ["O.", "O.", "O."],
                                ["O.", ".O", "O."]]]

    expect(braille_translator.format_braille_for_translation(unformatted_braille)).to eq(expected_braille_letters)
  end

  it "can translate braille letters back to english " do
    braille_letters = [[["O.", "OO", ".."],
                        ["O.", ".O", ".."],
                        ["O.", "O.", "O."],
                        ["O.", "O.", "O."],
                        ["O.", ".O", "O."]]]
    expect(braille_translator.translate_braille_letters(braille_letters)).to eq([["h", "e", "l", "l", "o"]])
  end

  it "can create a printable english message from braille" do
    unformatted_braille = "O.O.O.O.O.\nOO.OO.O..O\n....O.O.O.\n"

    expect(braille_translator.braille_to_english(unformatted_braille)).to eq("hello")
  end
end
