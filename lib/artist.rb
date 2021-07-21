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

    def add_song(name)
        name.artist = self
    end

    def songs
        Song.all.select { |song| song.artist == self }
    end

    def self.find(name)
        self.all.find { |artist| artist.name == name }
    end

    def self.find_or_create_by_name(name)
        self.find(name) ? self.find(name) : self.new(name)
    end

    def print_songs
        Song.all.each { |song| puts song.name if song.artist == self }
    end

end