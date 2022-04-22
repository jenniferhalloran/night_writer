require './spec/spec_helper'

RSpec.describe Dictionary do
  let(:dictionary) {Dictionary.new}


  it "exists" do
    expect(dictionary).to be_a(Dictionary)
  end

  it "has a dictionary of english letter to braille" do
    expect(dictionary.letters.class).to eq(Hash)
  end

  it "can translate the given letter" do
    expect(dictionary.letters["a"]).to eq("O.\n..\n..")
    expect(dictionary.letters["d"]).to eq("00\n.0\n..")
  end
end
