require "file_encryptor"

describe FileEncryptor do
  xit "reads in a line froma text file and outputs encrypted line" do
    file_encryptor = described_class.new
    test_file = File.new("test_file.txt", "w+") {|file| file.write("hello world")}

    file_encryptor.encrypt_line(test_file)

    encrypted_file = File.open("encrypted_test_file.txt")
    encrypted_file.gets.should == 0
  end

  it "outputs a new text file with 'encrypted' prefixed to the file name" do
    file_encryptor = described_class.new
    test_file1 = File.new("test_file1.txt", "w+")

    file_encryptor.output(test_file1)

    path_to_encrypted_files = File.expand_path(".") + "/encrypted_files"
    File.exist?("#{path_to_encrypted_files}/encrypted_test_file1.txt").should be_true

    File.delete("test_file1.txt")
    File.delete("#{path_to_encrypted_files}/encrypted_test_file1.txt")
  end
end
