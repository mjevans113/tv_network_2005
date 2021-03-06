class Network
  attr_reader :name,
              :shows
  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    all_characters = []
    main = []
    @shows.each do |show|
      show.characters.each {|character| all_characters << character}
    end
    all_characters.each do |character|
      main << character if character.name == character.name.upcase
    end
    main
  end

  def actors_by_show
    # show_actors = @shows.map do |show|
    #   show.actors
    # end
    @shows.group_by do |show|
      show.actors
    end.invert
  end
end
