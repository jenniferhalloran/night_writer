require './spec/spec_helper'

RSpec.describe NightWriter do
  let(:nightwriter) {NightWriter.new}
  let(:translator) {Translator.new}

  it "exists" do
    expect(nightwriter).to be_a(NightWriter)
  end

  xit "can write the message to a new file" do
    File.write('./message.txt', "hello")
    nightwriter.read_and_write_to_file("./message.txt", "./braille.txt")

    expect(File.read("./braille.txt")).to eq("O.O.O.O.O.\nOO.OO.O..O\n....O.O.O.")
  end

end
