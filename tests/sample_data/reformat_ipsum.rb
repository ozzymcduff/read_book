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

def pick_max_80_chars(words)
    count = 0
    gw = words.take_while do |w| 
        count+=w.length+1
        count<80 
    end
    words.slice!(0,gw.length)
    return gw.join(' ')
end

def break_on_80_chars(line)
    words = line.split(' ')
    newline = []
    newline.push pick_max_80_chars(words)
    while words.length>0
        newline.push pick_max_80_chars(words)
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