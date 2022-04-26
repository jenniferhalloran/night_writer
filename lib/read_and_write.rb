module ReadAndWrite

  def read_and_write_to_file(read_file_name, write_file_name, translator, file_to_count)
    untranslated_message = File.read(read_file_name)
    translated_message = translator.translate(untranslated_message)
    File.write(write_file_name, translated_message)
    puts "Created '#{write_file_name}' containing #{message_size(file_to_count)} characters"
  end

  def message_size(file_to_count)
    File.read(file_to_count).chomp.size
  end

end
