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
    def test_that_it_parses_chapter
        c = @c.chew(ReadBook::ReadHtml.new($contents))
        assert_equal "Lorem Ipsum", c.heading
        assert_equal 1, c.number
    end

    def test_should_not_recognize
        assert !@c.familiar?(ReadBook::ReadHtml.new("\ntext\ntext\n")), 'should not look familiar'
    end
end
