require './lib/translator.rb'

RSpec.describe Translator do
  let(:translator) {Translator.new}

  it "exists" do
    expect(translator).to be_a(Translator)
  end

  it "has readable attributes" do
    expected_keys = ["a", "b", "c", "d", "e", "f", "g",
                         "h", "i", "j", "k", "l", "m", "n",
                         "o", "p", "q", "r", "s", "t", "u",
                         "v", "w", "x", "y", "z", " "]

    expect(translator.braille_equivalent.keys).to eq(expected_keys)
  end

  it "can break given english string into characters" do
    expect(translator.breakdown_message("hello")).to eq(["h", "e", "l", "l", "o"])
  end

  it "can translate an individual character" do
    expect(translator.translate_to_braille("h")).to eq(["O.", "OO", ".."])
    expect(translator.translate_to_braille(" ")).to eq(["..", "..", ".."])

  end
  it "can translate the broken up english string to unformatted braille" do
    expected_unformatted_braille = [["O.", "OO", ".."], ["O.", ".O", ".."],
                                    ["O.", "O.", "O."], ["O.", "O.", "O."],
                                    ["O.", ".O", "O."]]

    expect(translator.translate_string_breakdown("hello")).to eq(expected_unformatted_braille)
  end

  it "can format braille letters into printable braille in three rows of two characters" do
      unformatted_braille = [["O.", "OO", ".."], ["O.", ".O", ".."],
                             ["O.", "O.", "O."], ["O.", "O.", "O."],
                             ["O.", ".O", "O."]]
    expect(translator.format_braille_letters(unformatted_braille)).to eq("O.O.O.O.O.\nOO.OO.O..O\n....O.O.O.\n")
  end

  it "can split messages over 40 braille characters onto multiple lines" do
    braille_letters = translator.translate_string_breakdown("hello this is going to be just long enough")
    printable_braille = translator.format_braille_letters(braille_letters)
    expect(printable_braille).to eq("O.O.O.O.O....OO..O.O...O.O..OOO..OOOOO...OO...O.O....OO..O.O..O.O.OOOO..O.OOO.O.\n" +
                                     "OO.OO.O..O..OOOOO.O...O.O...OO.OO..OOO..OO.O..O..O..OO..O.OO..O..O.OOO...O.O.O..\n" +
                                     "....O.O.O...O.....O.....O.....O...O.....O.O...........OOO.O...O.O.O.......O.O.OO\n" +
                                     "OOO.\n" +
                                     "OOOO\n" +
                                     "....\n")
  end

  it "can format a braille message for translation" do
    unformatted_braille = "O.O.O.O.O.\nOO.OO.O..O\n....O.O.O.\n"
    expected_braille_letters =[[["O.", "OO", ".."],
                                ["O.", ".O", ".."],
                                ["O.", "O.", "O."],
                                ["O.", "O.", "O."],
                                ["O.", ".O", "O."]]]

    expect(translator.format_braille_for_translation(unformatted_braille)).to eq(expected_braille_letters)
  end

  it "can translate braille letters back to english " do
    braille_letters = [[["O.", "OO", ".."],
                        ["O.", ".O", ".."],
                        ["O.", "O.", "O."],
                        ["O.", "O.", "O."],
                        ["O.", ".O", "O."]]]
    expect(translator.translate_braille_letters(braille_letters)).to eq([["h", "e", "l", "l", "o"]])
  end

  it "can create a printable english message from braille" do
    unformatted_braille = "O.O.O.O.O.\nOO.OO.O..O\n....O.O.O.\n"

    expect(translator.braille_to_english(unformatted_braille)).to eq("hello")
  end

end
