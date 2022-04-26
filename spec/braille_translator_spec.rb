require 'simplecov'
SimpleCov.start

require "./lib/braille_translator.rb"

RSpec.describe BrailleTranslator do
  let(:braille_translator) {BrailleTranslator.new}

  it "exists" do
    expect(braille_translator).to be_a(BrailleTranslator)
  end

  it "has readable attributes" do
    expected_keys = ["a", "b", "c", "d", "e", "f", "g",
                     "h", "i", "j", "k", "l", "m", "n",
                     "o", "p", "q", "r", "s", "t", "u",
                     "v", "w", "x", "y", "z", " "]
    expect(braille_translator.english_translations.values).to eq(expected_keys)
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

  it "can translate an individual character" do
    expect(braille_translator.translate_letter(["O.", "OO", ".."], braille_translator.english_translations)).to eq("h")
    expect(braille_translator.translate_letter(["..", "..", ".."], braille_translator.english_translations)).to eq(" ")
  end

  it "can translate multiple braille letters back to english " do
    braille_letters = [[["O.", "OO", ".."],
                        ["O.", ".O", ".."],
                        ["O.", "O.", "O."],
                        ["O.", "O.", "O."],
                        ["O.", ".O", "O."]]]
    expect(braille_translator.translate_braille_letters(braille_letters)).to eq([["h", "e", "l", "l", "o"]])
  end

  it "can create a printable english message from braille" do
    unformatted_braille = "O.O.O.O.O.\nOO.OO.O..O\n....O.O.O.\n"

    expect(braille_translator.translate(unformatted_braille)).to eq("hello")
  end
end
