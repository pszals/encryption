require "cipher"

describe Cipher do
  let(:encryptor) { described_class.new }

  describe "creating a cipher" do
    it "maps indexes to characters" do
      map = encryptor.indexes_to_characters
      map[0].should == "A"
    end

    it "maps characters to indexes" do
      map = encryptor.characters_to_indexes
      map["A"].should == 0
    end
  end
end
