class FilmCollection
  attr_accessor :films, :directors

  def initialize(films = [])
    @films = films
    @directors = films.map(&:director).uniq.shuffle
  end

  def directors_to_s
    @directors.map.with_index(1) { |director, index| "#{index}. #{director}" }.join("\n")
  end

  def films_by_director(director)
    @films.select { |film| film.director == director }
  end
end
