module ReadBook
require 'nokogiri'
    class ReadHtml
        def initialize(content)
            @content = content
            @lines = Lines.new(@content.split("\n"))
        end
        def to_tree
             map_children_to_tree(Nokogiri::HTML(@content).css('body'))
        end

        def line
            @lines.line
        end
        def peek
            @lines.peek
            #yield Lines.new(@lines.rest)
        end
        def peek_while
            while yield @lines.peek
                @lines.line
            end
        end

        def map_children_to_tree(noko)
            noko.children.map do |elem|
                m = {:name=>elem.name }
                if elem.name == 'text' && elem.text && !elem.text.empty?
                    m[:text] = elem.text
                end
                children=map_children_to_tree(elem)
                if children.length>0
                    m[:children] = children
                end

                m
            end
        end

    end
end