class Movie < ApplicationRecord
    has_many :reviews
    has_many :movie_watches
    has_many :users, through: :reviews
    has_many :responses, through: :reviews


    def self.fan_fav
        movies=Movie.all
        fav = movies.select{|movie| movie.likes}.max
        p fav.title
    end

    def self.most_talked_about
        reviews = Review.all
        movies = Movie.all
        themaps = reviews.map{|review| review.movie_id}

        freq = themaps.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
         theoneid =  themaps.max_by { |v| freq[v] }

          damovie = movies.select{|movie| movie.id == theoneid}
          p damovie
    end

    def self.most_watched
        watches = MovieWatch.all
        movies = Movie.all

        watchids = watches.map{|watch| watch.movie_id}

        freq = watchids.inject(Hash.new(0)) { |h,v| h[v] +=1; h}
        themostfreq = watchids.max_by { |v| freq[v]}

        daone= movies.select{|movie| movie.id == themostfreq}
        p daone
    end



end
