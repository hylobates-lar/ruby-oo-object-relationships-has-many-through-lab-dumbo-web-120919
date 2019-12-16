class Artist
    attr_accessor :name 

    @@all = []

    def initialize(name)
        @name = name

        @@all << self
    end

    def self.all 
        @@all
    end

    def new_song(name, genre)
        added_song = Song.new(name, self, genre)
        added_song.artist = self 
        added_song
    end

    def songs
        Song.all.select do |song|
            song.artist == self 
        end
    end

    def genres
        artist_songs = Song.all.select do |song|
            song.artist == self 
        end
        artist_songs.map do |song|
            song.genre 
        end
    end
end