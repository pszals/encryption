require "encryptor"

describe Encryptor do
  let(:encryptor) { described_class.new }

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

    it "encrypts a whole string" do
      encryptor.encrypt_line("abc", 1).should == "bcd"
    end
  end

  describe "multiplicative encryption" do
    it "encrypts a number of characters by a given amount, then increments rotational and continues to encrypt" do
      encryptor.multiplicative_encrypt("1234", 1).should == "2468"
    end

    it "encrypts by resetting rotational amount" do
      encryptor.resetting_encrypt("111111", 3).should == "456456"
    end
  end
end
