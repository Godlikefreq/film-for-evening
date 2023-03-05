require 'addressable/uri'
require 'nokogiri'
require 'open-uri'
require_relative 'film'
require_relative 'film_collection'

module FilmParser
  extend self

  WIKI_IMDB250_URL = "https://ru.wikipedia.org/wiki/250_лучших_фильмов_по_версии_IMDb".freeze

  def from_wiki_imdb250
    doc = URI.open(Addressable::URI.parse(WIKI_IMDB250_URL).normalize) { |uri| Nokogiri::HTML(uri) }

    films =
      doc.xpath("//tr").map do |element|
        Film.new(
          element.css('td[2]').text.chomp,
          element.css('td[4]').text.chomp,
          element.css('td[3]').text.to_i
        )
      end

    films = films.drop(1)
    FilmCollection.new(films)
  end
end