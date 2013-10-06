module ReadBook
    class Lines
        def initialize(lines, line = nil)
            @lines = lines
            @line = if line then line else 0 end
        end
        def line
            Line.new(@lines[@line].tap do |l|
                @line += 1
            end)
        end
        def peek
            Line.new(@lines[@line])
        end
        def rest
            @lines.drop(@line)
        end
        def find(matchexpr)
            while @line<@lines.length
                if (line.match?(matchexpr))
                    return
                end
            end
            raise MatchException, "!found"
        end
        def peek_while
            nxt = peek
            while yield(nxt)
                @line+=1 # drops the line
                nxt = peek
            end
        end

    end
end