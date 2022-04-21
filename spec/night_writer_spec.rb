require './spec/spec_helper'

RSpec.describe NightWriter do
  let(:nightwriter) {NightWriter.new}

  it "exists" do
    ##do I have to mock/stub?? Merp
    expect(nightwriter).to be_a(NightWriter)
  end


  it "can read the message written in the given file" do

    expect(nightwriter.read_message).to be_a(String)
    expect(nightwriter.read_message).to eq("a\n")
  end

  it "can write the message to a new file" do
    ##ooh...I have no idea how to test this.
    expect(nightwriter.write_message_to_file).to eq(nil)
  end

end
