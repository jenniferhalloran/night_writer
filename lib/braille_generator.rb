

class BrailleGenerator
  attr_reader :top,
              :middle,
              :bottom

  def initialize
    @top = []
    @middle = []
    @bottom = []
  end


  def format_braille_letters(letter)
    @top << letter[0]
    @middle << letter[1]
    @bottom << letter[2]
  end



end
