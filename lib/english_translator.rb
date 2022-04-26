require './lib/translator'

class EnglishTranslator < Translator

  def initialize
    @braille_message = []
  end

  def english_to_braille(english_string)
    english_characters = breakdown_message(english_string)
    braille_letters = translate_message(english_characters, braille_translations)
    format_braille_letters(braille_letters)
  end

  def breakdown_message(english_string)
    english_string.chomp.chars
  end

  def format_braille_letters(braille_letters)
    braille_lines = braille_letters.transpose
    create_line_breaks(braille_lines)
    @braille_message.flatten.join
  end

  def create_line_breaks(braille_lines)
    index = 0
    (braille_lines[0].count.to_f / 40).ceil.times do
      braille_lines.each do |line|
        @braille_message << line[index..index + 39]
        @braille_message << "\n"
      end
      index += 40
    end
  end

end
