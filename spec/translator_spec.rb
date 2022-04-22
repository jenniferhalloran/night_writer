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

  # it "can translate each letter in the broken up string to unformatted braille" do
  #
  #   expect(translator.translate_each_letter(["h", "e", "l", "l", "o"])).to eq([["O.", "OO", ".."]])
  # end
  #
  # it "can format braille into 3 rows on top of one another" do
  #   braille_generator.format_braille_letters(["O.", "..", ".."])
  #   expect(braille_generator.top).to eq(["O."])
  #   expect(braille_generator.middle).to eq([".."])
  #   expect(braille_generator.bottom).to eq([".."])
  # end


end
