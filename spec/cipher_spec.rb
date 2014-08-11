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

  describe "decryption" do
    it "decrypts a character" do
      encryptor.decrypt_char("b", 1).should == "a"
    end

    it "decrypts a whole string" do
      encryptor.decrypt_line("bcd", 1).should == "abc"
    end
  end

  it "decrypts by resetting rotational amount" do
    encryptor.resetting_decrypt("456456", 3).should == "111111"
  end
end
