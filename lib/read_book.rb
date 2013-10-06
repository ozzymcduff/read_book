module ReadBook
    readbook_root = File.expand_path(File.dirname(__FILE__))
    $: << readbook_root
    $: << File.join(readbook_root, "read_book")
    $: << File.join(readbook_root, "read_book", 'recognizers')
    require 'read_book/line'
    require 'read_book/lines'
    require 'read_book/match_exception'
    require 'read_book/recognizers/recognize_content'
    require 'read_book/recognizers/recognize_chapter'
    require 'read_book/read_html'
end
