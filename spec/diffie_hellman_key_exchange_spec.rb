require "diffie_hellman_key_exchange"

describe DiffieHellmanKeyExchange do
  before(:each) do
    @exchange = described_class.new(23, 5)
    @alices_key = 6
    @bobs_key = 15
  end

  it "creates a public message from a secret" do
    @exchange.create_public_message(@alices_key).should == 8
    @exchange.create_public_message(@bobs_key).should == 19
  end

  it "decrypts the common secret" do
    bobs_message = 19
    alices_message = 8

    @exchange.decrypt_common_secret(bobs_message, @alices_key).should == 2
    @exchange.decrypt_common_secret(alices_message, @bobs_key).should == 2
  end
end
