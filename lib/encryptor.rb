class Encryptor < Cipher
  def initialize
    @indexes_to_characters ||= indexes_to_characters
    @characters_to_indexes ||= characters_to_indexes
  end

  def encrypt_char(char, amount_to_rotate)
    return " " unless index = characters_to_indexes[char]
    rotational_magnitude = index + amount_to_rotate
    new_character_index = rotational_magnitude % indexes_to_characters.length

    indexes_to_characters[new_character_index]
  end

  def resetting_encrypt(line, rotation)
    encrypted_line = ""
    rotate = rotation
    line.split(//).each_with_index do |char, index|
      rotate = rotation if index % rotation == 0
      encrypted_line << encrypt_char(char, rotate)
      rotate += 1
    end
    encrypted_line
  end

  def multiplicative_encrypt(line, rotation)
    encrypted_line = ""
    rotate = rotation
    line.split(//).each do |char| 
      encrypted_line << encrypt_char(char, rotate)
      rotate += rotation
    end
    encrypted_line
  end

  def encrypt_line(line, amount_to_rotate)
    encrypted_line = ""
    line.each_char {|char| encrypted_line << encrypt_char(char, amount_to_rotate)}
    encrypted_line
  end
end
