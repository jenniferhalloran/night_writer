require 'simplecov'
SimpleCov.start

require "./lib/english_translator.rb"

RSpec.describe EnglishTranslator do
  let(:english_translator) {EnglishTranslator.new}

  it "exists" do
    expect(english_translator).to be_a(EnglishTranslator)
  end

  it "can access the translations" do
    expected_keys = ["a", "b", "c", "d", "e", "f", "g",
                         "h", "i", "j", "k", "l", "m", "n",
                         "o", "p", "q", "r", "s", "t", "u",
                         "v", "w", "x", "y", "z", " "]

    expect(english_translator.braille_translations.keys).to eq(expected_keys)
  end

  it "can break given english string into characters" do
    expect(english_translator.breakdown_message("hello")).to eq(["h", "e", "l", "l", "o"])
  end

  it "can translate an individual character" do
    expect(english_translator.translate_letter("h", english_translator.braille_translations)).to eq(["O.", "OO", ".."])
    expect(english_translator.translate_letter(" ", english_translator.braille_translations)).to eq(["..", "..", ".."])

  end
  it "can translate the broken up english string to unformatted braille" do
    expected_unformatted_braille = [["O.", "OO", ".."], ["O.", ".O", ".."],
                                    ["O.", "O.", "O."], ["O.", "O.", "O."],
                                    ["O.", ".O", "O."]]

    expect(english_translator.translate_message(["h", "e", "l", "l", "o"], english_translator.braille_translations)).to eq(expected_unformatted_braille)
  end

  it "can format braille letters into printable braille in three rows of two characters" do
      unformatted_braille = [["O.", "OO", ".."], ["O.", ".O", ".."],
                             ["O.", "O.", "O."], ["O.", "O.", "O."],
                             ["O.", ".O", "O."]]
    expect(english_translator.format_braille_letters(unformatted_braille)).to eq("O.O.O.O.O.\nOO.OO.O..O\n....O.O.O.\n")
  end

  it "can split messages over 40 braille characters onto multiple lines" do
    printable_braille = english_translator.english_to_braille("hello this is going to be just long enough")
    expect(printable_braille).to eq("O.O.O.O.O....OO..O.O...O.O..OOO..OOOOO...OO...O.O....OO..O.O..O.O.OOOO..O.OOO.O.\n" +
                                     "OO.OO.O..O..OOOOO.O...O.O...OO.OO..OOO..OO.O..O..O..OO..O.OO..O..O.OOO...O.O.O..\n" +
                                     "....O.O.O...O.....O.....O.....O...O.....O.O...........OOO.O...O.O.O.......O.O.OO\n" +
                                     "OOO.\n" +
                                     "OOOO\n" +
                                     "....\n")
  end
end
