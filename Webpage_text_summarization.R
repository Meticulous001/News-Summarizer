
library(xml2)
library(rvest)
library(lexRankr)

set.seed(103)

###give the url
file_url <- readline(prompt = "Enter the URL: ")

#file_url = "https://punchng.com/contempt-court-sends-ncac-boss-runsewe-to-prison/"

page = xml2::read_html(file_url)

page_text = rvest::html_text(rvest::html_nodes(page, "p"))


###using top rank for top 4 summary
top_4 <- lexRankr::lexRank(page_text,
                           docId = rep(1, length(page_text)), n = 4, continuous = T)


order_of_appearance <- order(as.integer(gsub("_","", top_4$sentenceId)))


###show top 4 headlines

order_top_4 <- top_4[order_of_appearance, "sentence"]


print(top_4$sentence)
