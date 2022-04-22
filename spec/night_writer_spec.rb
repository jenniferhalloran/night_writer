require './spec/spec_helper'

RSpec.describe NightWriter do
  let(:nightwriter) {NightWriter.new}
  let(:dictionary) {Dictionary.new}

  it "exists" do
    ##do I have to mock/stub?? Merp
    expect(nightwriter).to be_a(NightWriter)
  end


  it "can read the message written in the given file" do

    expect(nightwriter.read_message).to be_a(String)
    expect(nightwriter.read_message).to eq("abc")
  end

  xit "can write the message to a new file" do
    ##how do I test this? can I check the contents of braille.txt ?
    expect(nightwriter.write_message_to_file).to eq("Created 'braille.txt' containing 3 characters")
  end

  it "can convert the message to an unformated array of braille characters" do
    expect(nightwriter.breakdown_message).to be_a(Array)
    expect(nightwriter.breakdown_message).to eq([["O.", "..", ".."], ["O.", "O.", ".."], ["OO", "..", ".."]])
  end

end
