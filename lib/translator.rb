class Translator
  attr_reader :top,
              :middle,
              :bottom,
              :letter_to_braille

  def initialize
    @letter_to_braille = {
      "a" => ["O.", "..", ".."],
      "b" => ["O.", "O.", ".."],
      "c" => ["OO", "..", ".."],
      "d" => ["OO", ".O", ".."],
      "e" => ["O.", ".O", ".."],
      "f" => ['OO', 'O.', '..'],
      "g" => ["OO", "OO", ".."],
      "h" => ["O.", "OO", ".."],
      "i" => [".O", "O.", ".."],
      "j" => [".O", "OO", ".."],
      "k" => ["O.", "..", "O."],
      "l" => ["O.", "O.", "O."],
      "m" => ["OO", "..", "O."],
      "n" => ["OO", ".O", "O."],
      "o" => ["O.", ".O", "O."],
      "p" => ["OO", "O.", "O."],
      "q" => ["OO", "OO", "O."],
      "r" => ["O.", "OO", "O."],
      "s" => [".O", "O.", "O."],
      "t" => [".O", "OO", "O."],
      "u" => ["O.", "..", "OO"],
      "v" => ["O.", "O.", "OO"],
      "w" => [".O", "OO", ".O"],
      "x" => ["OO", "..", "OO"],
      "y" => ["OO", ".O", "OO"],
      "z" => ["O.", ".O", "OO"]
    }
    @top = []
    @middle = []
    @bottom = []
  end


  def english_to_braille(english_string)
    breakdown_message(english_string).map do |letter|
      letter = @dictionary.translations[letter]
    end
    #1. break it down into characters
    #2. convert english letters to braille
    #3. format the braille
    # Look up .transpose 
  end

  def breakdown_message(english_string)
    english_string.chomp.chars
  end

  # def translate
  #   breakdown_message.map do |letter|
  #     letter = @dictionary.translations[letter]
  #   end
  # end

  def format_braille_letters
    translate.each do |braille_letter|
      @top << braille_letter[0]
      @middle << braille_letter[1]
      @bottom << braille_letter[2]
    end
  end


end
