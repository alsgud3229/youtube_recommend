install.packages("")
#216번 215번 호환
library(httr)
library(rvest)
library(dplyr)
#158~257
url = "https://socialblade.com/youtube/top/country/us"
utube = read_html(url)
all_a_tag=(html_nodes(utube, 'a')) 
href=xml_attrs(all_a_tag[215:216],"href") #random 돌려야함
#href=xml_attrs(all_a_tag[158:167],"href") #random 돌려야함
a=strsplit(as.character(href), "/")
url2 = paste0("https://socialblade.com/youtube/",a[[1]][3],"/",a[[1]][4]) #user에서 channel로 변환됨
utube2 = read_html(url2)

menu = html_node(utube2,'#YouTubeUserMenu')

vid_menu=xml_attrs(xml_child(menu, 6))

a2 = strsplit(as.character(vid_menu), "/")
video_url=paste0("https://www.youtube.com/",a2[[1]][3],"/",a2[[1]][4],"/videos?sort=dd&view=0&shelf_id=0") #a[[1~10]][3], a[[1~10]][4]
utube3 = read_html(video_url)

t=html_nodes(utube3, '.yt-uix-sessionlink.yt-uix-tile-link.spf-link.yt-ui-ellipsis.yt-ui-ellipsis-2')
latest_video=xml_attr(t[1], "title")
url_of_latest_video=paste0("https://www.youtube.com", xml_attr(t[1], "href"))











#Unicode Code Point

write.csv(df, "/Users/kimminhyung/save.csv")
?write.csv()
?encode()
read.table("/Users/kimminhyung/save.csv", encoding="UTF-8")

df <- data.frame(col1=c('a','b','c','d','e') , col2=c(2, 4, 6, 8, 10)) 

?data.frame
  