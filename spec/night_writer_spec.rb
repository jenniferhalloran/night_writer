require './spec/spec_helper'

RSpec.describe NightWriter do
  let(:nightwriter) {NightWriter.new}

  it "exists" do
    ##do I have to mock/stub?? Merp
    expect(nightwriter).to be_a(NightWriter)
  end

end
