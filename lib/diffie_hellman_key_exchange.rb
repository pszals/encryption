class DiffieHellmanKeyExchange
  def initialize(prime_modulus, generator)
    @prime_modulus = prime_modulus
    @generator     = generator
  end

  def create_public_message(secret_key)
    @generator ** secret_key % @prime_modulus
  end

  def decrypt_common_secret(message, secret)
    message ** secret % @prime_modulus
  end
end
