require 'simplecov'
SimpleCov.start
require './lib/night_writer'

RSpec.describe NightWriter do
  let(:nightwriter) {NightWriter.new}

  it "exists" do
    expect(nightwriter).to be_a(NightWriter)
  end

  it "can write the message to a new file" do
    allow(File).to receive(:read).and_return("O.O.O.O.O.\nOO.OO.O..O\n....O.O.O.\n")

    expect(File.read("./braille.txt")).to eq("O.O.O.O.O.\nOO.OO.O..O\n....O.O.O.\n")
  end

end
