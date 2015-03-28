require "file_encryptor"

describe FileEncryptor do
  it "reads in a line from a text file and outputs encrypted line" do
    file_encryptor = described_class.new
    test_file = File.new("test_file.txt", "w+") {|file| file.write("hello world")}

    file_encryptor.encrypt_line(test_file)

    path_to_encrypted_files = File.expand_path(".") + "/encrypted_files"
    encrypted_file = File.open("#{path_to_encrypted_files}/encrypted_test_file.txt")
    encrypted_file.gets.should == 0

    File.delete("test_file.txt")
    File.delete("#{path_to_encrypted_files}/encrypted_test_file.txt")
  end

  it "outputs a new text file with 'encrypted' prefixed to the file name" do
    file_encryptor = described_class.new
    test_file1 = File.new("test_file1.txt", "w+")

    file_encryptor.output(test_file1)

    path_to_encrypted_files = File.expand_path(".") + "/encrypted_files"
    File.exist?("#{path_to_encrypted_files}/encrypted_test_file1.txt").should be_truthy

    File.delete("test_file1.txt")
    File.delete("#{path_to_encrypted_files}/encrypted_test_file1.txt")
  end

  it "adds a line of text to the file" do
    file_encryptor = described_class.new
    test_file1 = File.new("test_file1.txt", "w+")

    path_to_encrypted_files = File.expand_path(".") + "/encrypted_files"
    encrypted_file = File.open("#{path_to_encrypted_files}/encrypted_test_file.txt", "r")
    encrypted_file = file_encryptor.output(test_file1, "hyieee")

    encrypted_file.size
    contents = File.open(encrypted_file, 'r') {|f| f.gets}

    expect(contents).to eq("hyieee")
  end

end
