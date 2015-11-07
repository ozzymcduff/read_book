namespace ReadBook
type ChapterSection={Heading:string; Number:int; Text:string}
type Chapter={Header:string; Number:int;Sections:ChapterSection list}
type Contents={Contents:string list; Chapters:Chapter list}

