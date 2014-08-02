require "cipher"

describe Cipher do
  let(:encryptor) { described_class.new }

  describe "encrypting a single character" do
    it "rotates a letter by a given amouunt" do
      encryptor.encrypt_char("a", 1).should == "b"
      encryptor.encrypt_char("b", 2).should == "d"
    end

    it "rotates a number by a given amouunt" do
      encryptor.encrypt_char("9", 1).should == "A"
    end

    it "wraps around the alphabet range" do
      encryptor.encrypt_char("z", 1).should == "0"
    end

    it "maps indexes to characters" do
      map = encryptor.indexes_to_characters
      map[0].should == "A"
    end

    it "maps characters to indexes" do
      map = encryptor.characters_to_indexes
      map["A"].should == 0
    end

    it "converts an unkown character to an empty space" do
      encryptor.encrypt_char("$", 1).should == " "
      encryptor.encrypt_char(" ", 1).should == " "
    end
  end
end
