require './lib/night_writer'

RSpec.describe NightWriter do
  let(:nightwriter) {NightWriter.new}

  it "exists" do
    expect(nightwriter).to be_a(NightWriter)
  end

  it "can write the message to a new file" do
    expect(File.read("./braille.txt")).to eq("O.O.O.O.O.\nOO.OO.O..O\n....O.O.O.\n")
  end

end
