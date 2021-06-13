class Song

    @@all = []

    attr_accessor :name, :artist


    def initialize(name)
        @name = name
        @@all << self

    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        temp_array = filename.split(" - ")
        full_name = temp_array[0]
        song_title = temp_array[1]

        temp_song = Song.new(song_title)
        temp_song.artist = Artist.find_or_create_by_name(full_name)
        temp_song
    end

    def artist_name=(artist_name)
        temp_artist = Artist.find_or_create_by_name(artist_name)
        self.artist = temp_artist
    end

end