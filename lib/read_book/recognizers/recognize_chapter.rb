module ReadBook
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
        def heading_and_hr(el)
            heading = []
            heading.push el.line.text
            l = el.line
            while !l.hr?
                heading.push l.text
                l = el.line
            end
            l.hr
            return heading.join(' ')
        end
        def section_text_and_hr(el)
            text = []
            l = el.line
            while !l.hr?
                text.push l.text
                l = el.line
            end
            l.hr
            return text.join('\n')
        end
        def sections(c, el)
            cs = ChapterSection.new
            cs.number = el.line.text.to_i
            cs.heading = el.line.text
            cs.text = section_text_and_hr(el)
            c.sections.push cs


        end
        def chew(el)
            c = Chapter.new
            el.line.a.br
            l = el.line
            c.number = l.text.to_i
            c.heading = heading_and_hr(el)
            
            sections(c, el)
            return c
        end
    end
end