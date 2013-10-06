module ReadBook
    class Contents
        attr_reader :contents, :chapters
        def initialize()
            @contents = []
            @chapters = []
        end
    end

    class RecognizeContents
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
            c = Contents.new 
            el.line.hr
            el.line.a.br
            el.line.match(/^Contents/)
            
            el.peek_while do |line|
                line.many_dots?.tap do |m|
                    c.contents.push(line.to_s) if m
                end
            end

            nxt = el.peek
            while nxt.match?(/Chapter/)
                firstline = el.line
                if firstline.many_dots?
                    c.chapters.push(firstline.to_s)
                elsif el.peek.many_dots?
                    c.chapters.push(firstline.to_s+el.line.to_s)
                end
                nxt = el.peek
            end
            el.line.hr
            return c
        end

    end

end