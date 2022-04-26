require 'simplecov'
SimpleCov.start

require './lib/night_reader'

RSpec.describe NightReader do
  let(:night_reader) {NightReader.new}

  it "exists" do
    expect(night_reader).to be_a(NightReader)
  end

  it "can write the message to a new file" do
    allow(File).to receive(:read).and_return('hello')

    expect(File.read("./original_message.txt")).to eq("hello")
  end

  it "can write the corresponding message to the terminal" do
    expect{night_reader.read_and_write_to_file('./braille.txt', './original_message.txt', night_reader.braille_translator)}.to output("Created './original_message.txt' containing 33 characters\n").to_stdout
  end

end
