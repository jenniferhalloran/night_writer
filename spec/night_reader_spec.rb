require 'simplecov'
SimpleCov.start

require './lib/night_reader'

RSpec.describe NightReader do
  let(:nightreader) {NightReader.new}

  it "exists" do
    expect(nightreader).to be_a(NightReader)
  end

  it "can write the message to a new file" do
    expect(File.read("./original_message.txt")).to eq("hello")
  end

end
