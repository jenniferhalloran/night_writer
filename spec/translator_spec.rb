require './lib/translator'

RSpec.describe Translator do
  let(:translator) {Translator.new}

  it "exists" do

    expect(translator).to be_a(Translator)
  end

  it "has readable attributes" do

    expect(translator.letter_to_braille.keys).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
    expect(translator.top).to eq([])
    expect(translator.middle).to eq([])
    expect(translator.bottom).to eq([])
  end

  it "can break given english string into characters" do

    expect(translator.breakdown_message("hello")).to eq(["h", "e", "l", "l", "o"])
  end

  it "can translate an individual letter" do
    expect(translator.translate_english_letter("h")).to eq(["O.", "OO", ".."])

  end

  it "can translate the broken up english string to unformatted braille" do

    expect(translator.translate_string_breakdown(["h", "e", "l", "l", "o"])).to eq([["O.", "OO", ".."], ["O.", ".O", ".."], ["O.", "O.", "O."], ["O.", "O.", "O."], ["O.", ".O", "O."]])
  end

  it "can format braille letters in three rows of two characters" do

    expect(translator.format_braille_letters([["O.", "OO", ".."], ["O.", ".O", ".."], ["O.", "O.", "O."], ["O.", "O.", "O."], ["O.", ".O", "O."]])).to eq(" O.O.O.O.O. \n OO.OO.O..O \n ....O.O.O.")
  end

end
