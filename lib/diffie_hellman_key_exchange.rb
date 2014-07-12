class DiffieHellmanKeyExchange
  def initialize(prime_modulus, generator)
    @prime_modulus = prime_modulus
    @generator     = generator
  end

  def create_public_message(secret_key)
    @generator ** secret_key % @prime_modulus
  end

  def decrypt_common_secret(message, secret_key)
    message ** secret_key % @prime_modulus
  end
end
