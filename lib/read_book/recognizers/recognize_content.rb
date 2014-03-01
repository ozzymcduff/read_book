module ReadBook

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
        
        def rstrip(chars, txt)
            chars = Regexp.escape(chars)
            txt.gsub(/[#{chars}]+$/, "")
        end

        def chew(el)
            c = Contents.new 
            el.line.hr
            el.line.a.br
            el.line.match(/^Contents/)
            
            el.peek_while do |line|
                line.many_dots?.tap do |m|
                    puts m
                    c.contents.push(rstrip('.',m.to_s).rstrip) if m
                end
            end

            nxt = el.peek
            while nxt.match?(/Chapter/)
                firstline = el.line
                if firstline.many_dots? 
                    c.chapters.push(rstrip('.',firstline.text))
                elsif el.peek.many_dots?
                    txt = "#{firstline.text} #{el.line.text}"
                    c.chapters.push(rstrip('.',txt))
                end
                nxt = el.peek
            end
            el.line.hr
            return c
        end

    end

end