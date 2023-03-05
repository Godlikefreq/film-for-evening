class Film
  attr_reader :title, :director, :release_date

  def initialize(title, director, release_date)
    @title = title
    @director = director
    @release_date = release_date
  end

  def to_s
    "«#{@title}», (#{@release_date} г.)"
  end
end
