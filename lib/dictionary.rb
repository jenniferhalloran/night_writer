class Dictionary
  attr_reader :letters

  def initialize()
    @letters = {
      "a" => "O.\n..\n..",
      "b" => "O.\nO.\n..",
      "c" => "00\n..\n..",
      "d" => "00\n.0\n.."
    }
  end
end
