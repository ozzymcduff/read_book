txt = File.open(File.join(File.dirname(__FILE__),"lorem_ipsum.txt"),'r').read

first =  '<A name=7></a>C H A P T E R<br>
1<br>
Lorem<br>
Ipsum<br>
'
rest = '<hr>
<A name=8></a>2<br>
Lorem Ipsum<br>
'
def get_words_total_80_chars(words)
    count = 0
    index = 0
    array = []
    while count<80 && index<words.length
        w = words[index]
        index+=1
        count+=w.length
        array.push w
    end
    #puts "#{array}"
    #puts "#{words}"
    return array
end

def pick_80_chars(words)
    gw = get_words_total_80_chars(words)
    words.slice!(0,gw.length)
    return gw.join(' ')
end

def break_on_80_chars(line)
    words = line.split(' ')
    newline = []
    newline.push pick_80_chars(words)
    while words.length>0
        newline.push pick_80_chars(words)
    end
    return newline
end

lines = txt.split("\n").select do |line|
    !line.empty?
end.map do |line|
    break_on_80_chars(line).join("<br>\n")
end.reduce(first) do |memo, obj| 
    memo += rest+obj+"<br>\n"
end

#puts lines
File.open(File.join(File.dirname(__FILE__),"chapter.html"),'w') do |f|
    f<<lines
end