module ReadBook
    class Chapter
    end

    class RecognizeChapter
        def initialize
        end
        def familiar(elements)
            elements.peek do |el|
                chew(el)
            end
        end
        def familiar?(elements)
            begin
                elements.peek do |el|
                    chew(el)
                end
                return true
            rescue MatchException => e
                return false         
            end
            return false
        end
        def chew(el)
            c = Chapter.new
            return c
        end
    end
end