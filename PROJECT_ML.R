# Importing the packages
require(tm)
require(stringr)
# Reading the textfile
readLines("real_news.txt")

text <- paste(readLines("real_news.txt"),collapse=" ")
text2 <- gsub(pattern="\\W" , replace=" ",text)
text2 <- gsub(pattern="\\d" , replace=" ",text)
text2 <- tolower(text2)
text2 <- removeWords(text2, stopwords())
textbag <- str_split(text2, pattern="\\s+")  
textbag <- unlist(textbag)
fakewords <- scan('fakewords.txt',what= 'character',comment.char=";")
count <- sum(!is.na(match(textbag,fakewords)))
count
if(count>15){
	print("FAKE NEWS")
}else{
	print("REAL NEWS")
}
