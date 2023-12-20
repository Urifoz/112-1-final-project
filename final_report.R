library(readr)
dg6 <- readr::read_csv("https://data.cip.gov.tw/API/v1/dump/datastore/A53000000A-112010-003")
View(dg6)

#看報紙找工作性別比----
dg6 |>
  dplyr::filter(
    類別 == "性別"
  ) -> dg6_1

dg6_1 |>
  split(
    dg6_1$項目別
  ) -> split_dg6_1

split_dg6_1$女$看報紙/
  split_dg6_1$男$看報紙 -> summarise_gender

names(summarise_gender) <- 
  split_dg6_1$女$年度

summarise_gender


dg6 |>
  dplyr::filter(
    類別 == "年齡"
  ) -> dg6_age

View(dg6_age)

#老人跟年輕人看報紙找工作比例----
dg6_age |>
  split(
    dg6_age$項目別
  ) -> split_dg6_age

split_dg6_age$"15 ~ 19歲"$看報紙/
  split_dg6_age$"65歲及以上"$看報紙 -> summariseage

names(summariseage) <- 
  split_dg6_age$"15 ~ 19歲"$年度

summariseage


dg6 |>
  dplyr::filter(
    類別 == "年齡"
  ) -> dg6_2

View(dg6_2)

dg6_2 |>
  split(
    dg6_2$項目別
  ) -> split_dg6_2
#依年齡分別出託親友師長103~111----

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

#pie chart----
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


#折線圖----
dg6 |>
  dplyr::select(
    年度, 類別,看報紙,項目別
  ) |>
  dplyr::filter(
    類別 == "年齡"
  ) -> dg6_filtered

View(dg6_filtered)


ggplot(dg6_filtered, aes(x = 項目別, y = 看報紙, group = 年度, color = as.factor(年度))) +
  geom_line(size = 1) +
  geom_point(size = 3) +
  labs(title = "看報紙找到工作的
       年齡層人口折線圖", x = "年齡層", y = "人口") +
  scale_color_discrete(name = "年份") +
  theme_minimal()
