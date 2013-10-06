module ReadBook
    class Line
        def initialize(line)
            @line = line
        end
        def match?(matchexpr)
            matchexpr.match(@line)
        end
        def hr?
            match?(/<hr>/)
        end
        def hr
            raise MatchException, "hr? #{@line}" if ! hr?
            return self
        end
        def a?
            match?(/<[aA] /) && match?(/<\/[Aa]>/)
        end
        def a
            raise MatchException, "a? #{@line}" if ! a?
            return self
        end
        def br?
            match?(/<br\/?>$/)
        end
        def br
            raise MatchException, "br? #{@line}" if ! br?
            return self
        end
        def many_dots?
            match?(/.............................../)
        end
        def match(matchexpr)
            raise MatchException, "match? #{matchexpr} #{@line}" if ! match?(matchexpr)
            return self
        end
        def to_s
            @line 
        end
    end
end