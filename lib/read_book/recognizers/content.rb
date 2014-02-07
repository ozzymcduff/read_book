module ReadBook
    class Contents
        attr_reader :contents, :chapters
        def initialize()
            @contents = []
            @chapters = []
        end
    end
end