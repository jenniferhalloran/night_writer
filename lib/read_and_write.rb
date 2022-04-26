module ReadAndWrite

  def read_and_write_to_file(read_file_name, write_file_name, translator)
    string = File.read(read_file_name)
    message = translator.translate(string)
    File.write(write_file_name, message)
    puts "Created '#{write_file_name}' containing #{string.size} characters"
  end

end
