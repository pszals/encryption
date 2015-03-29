require './lib/encryptor'

class FileEncryptor
  def encrypt_line(file)
    encryptor = Encryptor.new
    path_to_encrypted_files = File.expand_path(".") + "/encrypted_files"
    path = "#{file.to_path}"
    words = ""
    IO.foreach(path) do |line|
      words += encryptor.resetting_encrypt(line, 3)
      # words += encryptor.multiplicative_encrypt(line, 1)
    end
    words
  end

  def output(file, text=nil)
    path_to_encrypted_files = File.expand_path(".") + "/encrypted_files"
    file_path = "#{path_to_encrypted_files}"+"/encrypted_#{file.to_path}"

    File.write(file_path, text)
  end
end
