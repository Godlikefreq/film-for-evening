require_relative 'lib/film_parser'

film_collection = FilmParser.from_wiki_imdb250

puts "Программа «Фильм на вечер» v. 2.0"
puts "Фильм какого режиссера вы хотите сегодня посмотреть?"

puts film_collection.directors_to_s

user_choice = 0

until user_choice.between?(1, film_collection.directors.size)
  puts "Выберите режиссера (введите соответствующую цифру)"
  user_choice = STDIN.gets.to_i
end

chosen_director = film_collection.directors[user_choice - 1]

films_by_director = film_collection.films_by_director(chosen_director)
random_film = films_by_director.sample

puts "И сегодня вечером рекомендую посмотреть:"
puts random_film
