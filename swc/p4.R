#zahra makim, p4 :)

install.packages("palmerpenguins")

library(tidyverse)
library(palmerpenguins)

palmerpenguins::penguins
View(penguins)
help(penguins) #can also use '?'

#scatter plot of mass and flipper length
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, 
                y = body_mass_g)) +
  geom_point()

#penguins with missing values.
#"missing values should never silently go missing. :)"
penguins |>
  select(species, flipper_length_mm, body_mass_g) |>
  filter(is.na(body_mass_g) | is.na(flipper_length_mm))


#added different colors for different species
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, 
                y = body_mass_gi
                color = species)) +
  geom_point()

    y  
#added GLOBAL smoove curve and species legend
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, 
                y = body_mass_g)) +
  geom_point(mapping = aes(color = species,
                           shape = species)) +
  geom_smooth()
 

#added nicer titles.
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, 
                y = body_mass_g)) +
  geom_point(mapping = aes(color = species,
                           shape = species)) +
  geom_smooth() + 
  labs (
    title = "Body Mass and Flipper Length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)",
    y = "Body mass (g)",
    color = "Species",
    shape = "Species"
  )


#-------EXERCISES--------# 
#1. there are 344 rows and 8 columns in 'penguins.'

#2.bill_length_mm is "a number denoting bill length" in millimeters.

#3. 
ggplot(
  data = penguins,
  mapping = aes(x = bill_depth_mm,
                y = bill_length_mm)) +
  geom_point(mapping = aes(color = species,
                           shape = species))
  #the relationship between these two variables is that bill length
  #and bill depth have a positive correlation, meaning as bill length
  #increases, so does bill depth. If we look at different species, the
  #Adelie species tends to have longer bill depth and the Gentoo penguins
  #tend to have longer bill length. 

#4. 
ggplot(
  data = penguins,
  mapping = aes(x = species,
                y = bill_length_mm)) +
  geom_point(mapping = aes(color = species,
                           shape = species))
  #this is unhelpful because if you plot this, it'sjust 3 straight
  #lines. This is because for each line the species is the same, so 
  #it really just shows the bill length for each individual penguin 
  #and doesn't show a relationship between anything. 

#5. 
#ggplot(data = penguins) + 
#  geom_point()
#this gives an error because it doesn't know what variables it is
#mapping. you would fix it by adding the 'mapping' argument with aes()
#and variables for x and y. 

#6. 
ggplot(
  data = penguins,
  mapping = aes(x = bill_depth_mm,
                y = bill_length_mm)) +
  geom_point(mapping = aes(color = species,
                           shape = species),
             na.rm = TRUE)
#this argument removes the points (2 in this case) that were the rows
#in the table with missing values. 

#7. 
ggplot(
  data = penguins,
  mapping = aes(x = bill_depth_mm,
                y = bill_length_mm)) +
  geom_point(mapping = aes(color = species,
                           shape = species),
             na.rm = TRUE) +
  labs (
    caption = "Data come from the palmerpenguins package."
  )

#8. 
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, 
                y = body_mass_g)) +
  geom_point(mapping = aes(color = bill_depth_mm,)) +
  geom_smooth()

#9. 
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)
) +
  geom_point() +
  geom_smooth(se = FALSE)

#10. 
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point() +
  geom_smooth()

ggplot() +
  geom_point(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  ) +
  geom_smooth(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  )

#they're the same, geom_point and _smooth use mapping so the second
#one is just writing them individually with the mapping



#More data visualization

#categorical variables, bars based on freq
ggplot(penguins, aes(x = fct_infreq(species))) +
  geom_bar()

#numerical variables (histogram)
ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram(binwidth = 200)
ggplot(penguins, aes(x = body_mass_g)) +
  geom_density()

#setting width of histogram intervals
ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram(binwidth = 20)
ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram(binwidth = 200)
ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram(binwidth = 2000)


#------------EXERCISES-------------#

#1. 
ggplot(penguins, aes(y = fct_infreq(species))) +
  geom_bar()
#it makes the plot a horizontal bar graph instead of vertical

#2. 
ggplot(penguins, aes(x = species)) +
  geom_bar(color = "red")

ggplot(penguins, aes(x = species)) +
  geom_bar(fill = "red")

#first one makes the outline red, and the second makes the whole bar red.

#3. 
ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram(bins = 10)
ggplot(penguins, aes(x = body_mass_g)) +
  geom_histogram(bins = 100)
#bins() changes the number of bars in the histogram. also, overriden by binwidth

#4. 
data(diamonds)
View(diamonds)
ggplot(diamonds, aes(x = carat)) +
  geom_histogram(bins = 25)
#i ran it with a variety of different bin numbers from 2-200, i think 25 reveals
#the pattern nicely without having too many bars to look at. 


#Visualizing relationships

#boxplot of body mass by species
ggplot(penguins, aes(x = species, y = body_mass_g)) +
  geom_boxplot()

#frequecy polygon of body mass by species
ggplot(penguins, aes(x = body_mass_g, color = species)) +
  geom_freqpoly(binwidth = 200, linewidth = 0.75)

#overlaid density plot of body mass by species
ggplot(penguins, aes(x = body_mass_g, color = species, fill = species)) +
  geom_density(alpha = 0.5)

#segmented bar plots of islands and species
ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar() #this one is count
ggplot(penguins, aes(x = island, fill = species)) +
  geom_bar(position = "fill") #this one is percent

#scatterplot with 4 variables #very confusing
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = island))

#same data, split into facets:
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = species)) +
  facet_wrap(~island)



#------------EXERCISES-------------#

#1. 
?mpg
#manufacturer name, model name, type of transmission, fuel type,
#class, drv(?) are categorical.

#2. 
data(mpg)
View(mpg)
ggplot(
  data = mpg,
  mapping = aes(x = hwy,
                y = displ)) +
  geom_point()

ggplot(
  data = mpg,
  mapping = aes(x = hwy,
                y = displ,
                color = cyl)) +
  geom_point()

ggplot(
  data = mpg,
  mapping = aes(x = hwy,
                y = displ,
                size = cyl)) +
  geom_point()

ggplot(
  data = mpg,
  mapping = aes(x = hwy,
                y = displ,
                color = cyl,
                size = cyl)) +
  geom_point()
#the color and size are more gradual versus if they were mapped to 
#a categorical variable, because numerical variables are continuous 
#and categorical is discrete. shape doesn't work with continuous variables.

#3. 
ggplot(
  data = mpg,
  mapping = aes(x = hwy,
                y = displ,
                linewidth = cyl)) +
  geom_point()
#nothing (?)

#4. 
ggplot(
  data = mpg,
  mapping = aes(x = hwy,
                y = displ,
                x = cyl)) +
  geom_point()
#you get an error

#5. 
ggplot(
  data = penguins,
  mapping = aes(x = bill_depth_mm,
                y = bill_length_mm,
                color = species)) +
  geom_point()
#ok i did this already earlier so i could clearly see the relationship
#but it definitely helps you see the positive correlation better than
#with an all-black points plot which looks kind of all over the place.

#6. 
ggplot(
  data = penguins,
  mapping = aes(
    x = bill_length_mm, y = bill_depth_mm, 
    color = species, shape = species
  )
) +
  geom_point() +
  labs(color = "Species")
#there's 2 different legends because the added labs() function  makes a 
#label for color that's capitalized and we didn't add a label for the shape.
#You would fix this by either getting rid of the label so they both say
#"species" combined into one or adding shape = "Species" to labs().


#Saving plots
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point()
ggsave(filename = "penguin-plot.png")



#------------EXERCISES-------------#
#1. 
ggplot(mpg, aes(x = class)) +
  geom_bar()
ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point()
ggsave("mpg-plot.png")
#saves the scatterplot because it's the most recent

#2. ggplot(mpg, aes(x = class)) +
ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point()
ggsave("mpg-plot.pdf")
#change pdf to png