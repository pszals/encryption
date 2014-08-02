class Cipher
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

  def indexes_to_characters
    map = {}
    letters = ("A".."z").to_a
    numbers = ("0".."9").to_a.each {|n| n.to_s}
    letters_and_numbers = letters + numbers
    letters_and_numbers.each_with_index { |char, index| map[index] = char }
    map
  end

  def characters_to_indexes
    map = {}
    @indexes_to_characters.each_pair {|index, char| map[char] = index }
    map
  end
end
