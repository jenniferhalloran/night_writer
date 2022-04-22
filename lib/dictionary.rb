class Dictionary
  attr_reader :letters

  def initialize()
    @letters = {
      "a" => "O.\n..\n..",
      "b" => "O.\nO.\n..",
      "c" => "OO\n..\n..",
      "d" => "OO\n.O\n..",
      "e" => "O.\n.O\n.."
    }
  end
end
