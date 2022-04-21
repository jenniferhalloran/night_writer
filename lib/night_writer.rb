class NightWriter
  attr_reader :existing_file,
              :new_file

  def initialize()
    @existing_file = "message.txt"#ARGV[0]
    @new_file = "braille.txt" #ARGV[1]
    ##may be good to have other default files if something is not entered.
  end

end
