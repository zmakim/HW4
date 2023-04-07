#zahra makim p3

#load in packages from the R library
library(babynames)
library(tidyverse)

#produces a help page with some information
help(babynames)
?babynames
help(package = "babynames")

#shows raw data
data(babynames)
head(babynames)
glimpse(babynames)

dplyr::glimpse(babynames)

#filters allow you to pick specific rows in the data such as the name or year
filter(babynames, name == "Lisa")
filter(babynames, name == "Lisa" & sex == "F")

#line graph of the popularity of the name "Lisa" over time.
ggplot(data = filter(babynames, name == "Lisa" & sex == "F"), mapping = aes(x = year, y = n)) + geom_line()

df_lisa <- filter(babynames, name == "Lisa" & sex == "F") #assigning the filter to the object 'df_lisa'
ggplot(data = df_lisa, mapping = aes(x = year, y = n)) + geom_line() + geom_point()

df_lisa_piped <- babynames %>% #magrittr pipe
  filter(., name == "Lisa" & sex == "F") #dot pronoun

#pipe down into several things to get specifics of the data
babynames %>%
  group_by(name, sex) %>%
  count %>%
  group_by(name) %>%
  count() %>%
  filter(n == 2)

data(babynames)

# How many rows are there for a specific name of your choice before or after a certain year?
# For beginners, you can depend on examining the dataframe to determine number of rows.
# If you have prior experience, try to write code that will actually provide the number of rows as the output. 

filter(babynames, name == "Zahra")
##after 1982 - dataframe has 35 more rows, so 35 rows

# Look at the help and examples for the dplyr function summarize(). 
# Use the summarize function to find the mean number (n) for a name
# for all years in the babynames data. 
# This is a harder question, and may take a lot of trial and error.
# HINT: you do not need to "group" for this task. 

babynames %>%
  filter(name == "Zahra") %>%
  summarize(total = sum(n),mean = mean(n))

# Now find the mean n for that name but only after the year 2000.
# Again, give it your best shot!
babynames %>%
  filter(name == "Zahra", year > 2000) %>%
  summarize(total = sum(n), mean = mean(n))

# Create a new dataframe that contains only the names from 2017,
# and use the arrange() function to sort it with the highest n
# names at the top.
babynames %>%
  filter(year == 2017) %>%
  arrange(desc(n))

# Filter the dataframe you just created to the names that 
# have an n above 10,000 for birth certificates marked "F". 
babynames %>%
  filter(year == 2017, sex == "F", n > 10000) %>%
  arrange(desc(n))

# Print/show the names in that dataframe to the console (just the names,
# not the other columns/data). There are various ways to do this!
df_2017_girls_pop_names <- babynames %>%
                          filter(year == 2017, sex == "F", n > 10000) %>%
                          arrange(desc(n))
select(df_2017_girls_pop_names, name)

# Paste below at least 5 of your code answers from the Posit Primer. 

filter(babynames, prop >= 0.08)
filter(babynames, name == "Khaleesi")
filter(babynames, is.na(n))

filter(babynames, name == "Sea")

filter(babynames, n %in% c(5,6,7,8,9))

babynames %>% 
  filter(year == 2017 & sex == "F") %>%
  select(name, n) %>%
  arrange(desc(n))

babynames %>%
  filter(name == "Zahra" & sex == "F") %>%
  select(year, prop) %>%
  ggplot() + geom_line(aes(x = year, y = prop)) + labs(title = "Popularity of Zahra")

babynames %>%
  filter(name=="Zahra", sex=="F") %>%
  summarize(total = sum(n), max = max(n), mean = mean(n))



#class4

babynames |>
  filter(name %in% c("Lisa", "Joseph", "Juan")) |>
  group_by(name, sex) |>
  summarize(yearmean = mean(n), propmean = mean(prop), yearsum = sum(n))

