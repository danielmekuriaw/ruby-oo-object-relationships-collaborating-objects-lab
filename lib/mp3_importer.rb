class MP3Importer

    attr_reader :path

    def initialize(path)
        @path = path
    end

    def files
        directory = Dir.entries(self.path)
        directory.select{
            |dir| dir.split(".")[-1] == "mp3"
        }
    end

    def import
        self.files.each{ |file_name|
            Song.new_by_filename(file_name)
        }
    end

end