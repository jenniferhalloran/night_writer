require './lib/translator'

class BrailleTranslator < Translator
  attr_reader :english_translations

  def initialize
    @english_translations = braille_translations.invert
  end

  def braille_to_english(braille_message)
    braille_letters = format_braille_for_translation(braille_message)
    english_array = translate_braille_letters(braille_letters)
    english_array.join
  end

  def format_braille_for_translation(braille_message)
    braille_arrays = braille_message.split("\n").map {|line| line.scan(/../)}.each_slice(3)
    braille_arrays.map{|array| array.transpose}
  end

  def translate_braille_letters(braille_letters)
    braille_letters.map { |braille_letter| translate_message(braille_letter, @english_translations) }
  end

end
