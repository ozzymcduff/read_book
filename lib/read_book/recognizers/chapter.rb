module ReadBook
    class Chapter
        attr_accessor :heading, :number
        attr_reader :sections
        def initialize()
            @sections = []
        end
    end
    class ChapterSection
        attr_accessor :heading, :number, :text
    end
end