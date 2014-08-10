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

  describe "additive encryption" do
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

    it "converts an unkown character to an empty space" do
      encryptor.encrypt_char("$", 1).should == " "
      encryptor.encrypt_char(" ", 1).should == " "
    end

    it "decrypts a character" do
      encryptor.decrypt_char("b", 1).should == "a"
    end

    it "encrypts a whole string" do
      encryptor.encrypt_line("abc", 1).should == "bcd"
    end

    it "decrypts a whole string" do
      encryptor.decrypt_line("bcd", 1).should == "abc"
    end
  end

  describe "multiplicative encryption" do
    it "encrypts a number of characters by a given amount, then increments rotational and continues to encrypt" do
      encryptor.multiplicative_encrypt("1234", 1).should == "2468"
    end

    it "decrypts a number of characters by a given amount, then decrements rotational and continues to decrypt" do
      encryptor.multiplicative_decrypt("2468", 1).should == "1234"
    end

    xit "resets rotational amount" do
      encryptor.resetting_encrypt("1111", 3).should == "4564"
    end
  end
end
