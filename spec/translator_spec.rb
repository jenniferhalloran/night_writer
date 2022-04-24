require './spec/spec_helper'

RSpec.describe Translator do
  let(:translator) {Translator.new}

  it "exists" do
    expect(translator).to be_a(Translator)
  end

  it "has readable attributes" do
    expect(translator.braille_equivalent.keys).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it "can break given english string into characters" do
    expect(translator.breakdown_message("hello")).to eq(["h", "e", "l", "l", "o"])
  end

  it "can translate an individual character" do
    expect(translator.translate_to_braille("h")).to eq(["O.", "OO", ".."])
    expect(translator.translate_to_braille(" ")).to eq(["..", "..", ".."])

  end
  it "can translate the broken up english string to unformatted braille" do
    expect(translator.translate_string_breakdown("hello")).to eq([["O.", "OO", ".."], ["O.", ".O", ".."], ["O.", "O.", "O."], ["O.", "O.", "O."], ["O.", ".O", "O."]])
  end

  it "can format braille letters in three rows of two characters" do
    expect(translator.format_braille_letters([["O.", "OO", ".."], ["O.", ".O", ".."], ["O.", "O.", "O."], ["O.", "O.", "O."], ["O.", ".O", "O."]])).to eq("O.O.O.O.O.\nOO.OO.O..O\n....O.O.O.\n")
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

end
