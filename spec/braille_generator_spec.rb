require './spec/spec_helper'

RSpec.describe BrailleGenerator do
  let(:braille_generator) {BrailleGenerator.new()}

  xit "exists" do
    expect(braille_generator).to be_a(BrailleGenerator)
  end

  xit "has readable attributes" do
    expect(braille_generator.top).to eq([])
    expect(braille_generator.middle).to eq([])
    expect(braille_generator.bottom).to eq([])
  end

  xit "can format braille into 3 rows on top of one another" do
    braille_generator.generate_braille_letter
    expect(braille_generator.top).to eq(["O."])
    expect(braille_generator.middle).to eq([".."])
    expect(braille_generator.bottom).to eq([".."])
  end


end
