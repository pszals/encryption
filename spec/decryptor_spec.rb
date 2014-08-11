require "decryptor"

describe Decryptor do
  let(:decryptor) { described_class.new }

  describe "decryption" do
    it "decrypts a character" do
      decryptor.decrypt_char("b", 1).should == "a"
    end

    it "decrypts a whole string" do
      decryptor.decrypt_line("bcd", 1).should == "abc"
    end
  end

    it "decrypts a number of characters by a given amount, then decrements rotational and continues to decrypt" do
      decryptor.multiplicative_decrypt("2468", 1).should == "1234"
    end

  it "decrypts by resetting rotational amount" do
    decryptor.resetting_decrypt("456456", 3).should == "111111"
  end
end
