require "./lib/english_translator.rb"

RSpec.describe Translator do
  let(:english_translator) {EnglishTranslator.new}

  it "exists" do
    expect(english_translator).to be_a(EnglishTranslator)
  end
end


def translate_braille_string(braille_letters)
  braille_letters.map { |braille_letter| translate_letter(braille_letter, @english_equivalent) }
end

def translate_string_breakdown(english_string)
  message_characters = breakdown_message(english_string)
  message_characters.map { |english_letter| translate_letter(english_letter, @braille_equivalent) }
end

def translate_message(message, dictionary)
  message.map {|letter| translate_letter(letter, dictionary)}
end
