require "file_encryptor"

describe FileEncryptor do
  it "reads in a line from a text file and outputs encrypted line" do
    text = "hello world, dark and dreary world"
    expect_any_instance_of(Encryptor).to receive(:resetting_encrypt).with(text, 3).and_return("blah")
    file_encryptor = described_class.new
    test_file = File.new("test_file.txt", "w+")
    test_file.write(text)
    test_file.close

    encrypted_text = file_encryptor.encrypt_line(test_file)

    expect(encrypted_text).to eq("blah")

    File.delete("test_file.txt")
  end

  it "outputs a new text file with 'encrypted' prefixed to the file name" do
    file_encryptor = described_class.new
    test_file1 = File.new("test_file1.txt", "w+")

    file_encryptor.output(test_file1)

    path_to_encrypted_files = File.expand_path(".") + "/encrypted_files"
    expect(File.exist?("#{path_to_encrypted_files}/encrypted_test_file1.txt")).to eq(true)

    File.delete("test_file1.txt")
    File.delete("#{path_to_encrypted_files}/encrypted_test_file1.txt")
  end

  it "adds a line of text to the file" do
    file_encryptor = described_class.new
    test_file = File.new("test_file.txt", "w+")
    file_encryptor.output(test_file, "hyieee")

    path_to_encrypted_files = File.expand_path(".") + "/encrypted_files"
    @file_path = "#{path_to_encrypted_files}/encrypted_test_file.txt"

    contents = ""

    IO.foreach(@file_path) do |line| contents += line end
    expect(contents).to eq("hyieee")

    File.delete("test_file.txt")
    File.delete("#{path_to_encrypted_files}/encrypted_test_file.txt")
  end
end
