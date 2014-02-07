$:.unshift File.join(File.dirname(__FILE__),'..','lib')
require 'read_book'
require "test/unit"
$contents = File.open(File.join(File.dirname(__FILE__),"sample_data","chapter.html"),'r').read

class RecognizeChapterTests < Test::Unit::TestCase
    def setup
        @c = ReadBook::RecognizeChapter.new
    end
    def test_that_it_recognizes_chapter
        @c.familiar(ReadBook::ReadHtml.new($contents))
    end
    def test_should_not_recognize
        assert !@c.familiar?(ReadBook::ReadHtml.new("\ntext\ntext\n"+$contents)), 'should not look familiar'
    end
end
