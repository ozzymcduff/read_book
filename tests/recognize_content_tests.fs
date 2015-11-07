module recognize_content_tests
open NUnit.Framework
let contents = """<hr>
<A name=8></a>v<br>
Contents<br>
First ........................................................................................ <A href="index.html#8">vii</a><br>
Second ........................................................................................ <A href="index.html#10">ix</a><br>
Third..................................................................................................... <A href="index.html#12">xi</a><br>
Chapter<br>
1: First chapter....................................................................... <A href="index.html#17">1</a><br>
Chapter 2: Second chapter .......................................................................<A href="index.html#18">2</a><br>
<hr>"""

[<TestFixture>]
type RecognizeContentsTests()=
    member self.Test()=""