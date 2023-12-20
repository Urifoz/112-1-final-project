library(readr)
dg6 <- readr::read_csv("https://data.cip.gov.tw/API/v1/dump/datastore/A53000000A-112010-003")
View(dg6)

dg6 |>
  dplyr::filter(
    類別 == "性別"
  ) -> dg6_1

dg6_1 |>
  split(
    dg6_1$項目別
  ) -> split_dg6_1

split_dg6_1$女$看報紙/
  split_dg6_1$男$看報紙 -> summarise1

names(summarise1) <- 
  split_dg6_1$女$年度

summarise1


dg6 |>
  dplyr::filter(
    類別 == "年齡"
  ) -> dg6_2

View(dg6_2)

dg6_2 |>
  split(
    dg6_2$項目別
  ) -> split_dg6_2

split_dg6_2$"15 ~ 19歲"$看報紙/
  split_dg6_2$"65歲及以上"$看報紙 -> summarise2

names(summarise2) <- 
  split_dg6_2$"15 ~ 19歲"$年度

summarise2

#依年齡分別出託親友師長103~111----
dg6 |>
dplyr::filter(
類別 == "年齡"
) -> dg6_2

View(dg6_2)

dg6_2 |>
split(
dg6_2$項目別
) -> split_dg6_2

split_dg6_2$"15 ~ 19歲"$託親友師長介紹 -> summarise_1
split_dg6_2$"20 ~ 24歲"$託親友師長介紹 -> summarise_2
split_dg6_2$"25 ~ 29歲"$託親友師長介紹 -> summarise_3
split_dg6_2$"30 ~ 34歲"$託親友師長介紹 -> summarise_4
split_dg6_2$"35 ~ 39歲"$託親友師長介紹 -> summarise_5
split_dg6_2$"40 ~ 44歲"$託親友師長介紹 -> summarise_6
split_dg6_2$"45 ~ 49歲"$託親友師長介紹 -> summarise_7
split_dg6_2$"50 ~ 54歲"$託親友師長介紹 -> summarise_8
split_dg6_2$"55 ~ 59歲"$託親友師長介紹 -> summarise_9
split_dg6_2$"60 ~ 64歲"$託親友師長介紹 -> summarise_10
split_dg6_2$"65歲及以上"$託親友師長介紹 -> summarise_11

names(summarise_1) <-
split_dg6_2$"15 ~ 19歲"$年度

summarise_1

names(summarise_2) <-
split_dg6_2$"20 ~ 24歲"$年度

summarise_2

names(summarise_3) <-
split_dg6_2$"25 ~ 29歲"$年度

summarise_3

names(summarise_4) <-
split_dg6_2$"30 ~ 34歲"$年度

summarise_4

names(summarise_5) <-
split_dg6_2$"35 ~ 39歲"$年度

summarise_5

names(summarise_6) <-
split_dg6_2$"40 ~ 44歲"$年度

summarise_6

names(summarise_7) <-
split_dg6_2$"45 ~ 49歲"$年度

summarise_7

names(summarise_8) <-
split_dg6_2$"50 ~ 54歲"$年度

summarise_8

names(summarise_9) <-
split_dg6_2$"55 ~ 59歲"$年度

summarise_9

names(summarise_10) <-
split_dg6_2$"60 ~ 64歲"$年度

summarise_10

names(summarise_11) <-
split_dg6_2$"65歲及以上"$年度

summarise_11

#pie chart
dg6 |>
  dplyr::select(
    3:21
  ) |>
  dplyr::filter(
    項目別=="-"
  ) -> dg6_filtered_3

View(dg6_filtered_3)

x <- as.numeric(dg6_filtered_3[1, ][4:19])
labels <- c(colnames(dg6_filtered_3[1, ][4:19]))

# Give the chart file a name.
png(file = "103.jpg")

# Plot the chart.
pie(x,labels)

# Save the file.
dev.off()
