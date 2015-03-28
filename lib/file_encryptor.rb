class FileEncryptor

  def encrypt_line(file)
    path_to_encrypted_files = File.expand_path(".") + "/encrypted_files"
    file_to_encrypt = File.open("#{path_to_encrypted_files}"+"/encrypted_#{file.to_path}", "w+")
    output(file)
  end

  def output(file, text=nil)
    path_to_encrypted_files = File.expand_path(".") + "/encrypted_files"
    file = File.new("#{path_to_encrypted_files}"+"/encrypted_#{file.to_path}", "w+")

    file.write(text)
    file
  end
end
