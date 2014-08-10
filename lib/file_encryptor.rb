class FileEncryptor
  def output(file)
    path_to_encrypted_files = File.expand_path(".") + "/encrypted_files"
    File.new("#{path_to_encrypted_files}"+"/encrypted_#{file.to_path}", "w+")
  end
end
