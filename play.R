# Load libraries
library("tidyverse")
library("ds4ling")

# how to make a scatter plot
ggplot(mtcars) +
  aes(x = drat, y = mpg) + #the variables
  geom_point() + #adding the geom point
  geom_smooth(method = "lm") #fitting the model

glimpse(test_scores_rm)

#bivariate correlation
test_scores_rm$test1 #give me the column (as a vector)

cor(test_scores_rm$test1, test_scores_rm$test2)

test_scores_rm |>
  ggplot() +
  aes(x = test1, y = test2) +
  geom_point()

cor.test(test_scores_rm$test1, test_scores_rm$test2) #also does a hypothesis test

# dplyr
# select() will select columns of a dataframe , will produce a new dataframe with just the new columns that were selected

mtcars |>
  select(mpg, poo = disp, am)

mtcars |> 
  select(mpg:drat) #select the columns between mpg and drat

glimpse(mtcars)

mtcars |>
  select(cyl, hp, wt)

mtcars |>
  select(am, gear, carb)

mtcars |>
  select(hello_world = mpg)

# filter (filters rows of dataframe to produce a new dataframe)
# You can use logical operators in filter

mtcars |>
  filter(mpg < 20, mpg > 14) # mpg is less than 20 or greater than 14

mtcars |>
  filter(cyl == 6) # filter rows which cyl is equal to 6 

mtcars |>
  filter(mpg > 20 | disp < 200) # filter mpg is greater than 20 OR disp is less than 200 

# arrange mtcars dataset based on cyl and disp
mtcars |>
  arrange(cyl, disp)

# arrange mtcars dataset based on mpg from highest to lowest
mtcars |>
  arrange(desc(mpg))

# Mutate, select the mpg column and then create a new column called mpg_x2 that doubles every value in the dataframe

mtcars |>
  select(mpg) |>
  mutate(mpg_x2 = mpg * 2)

#  create a new column called mpg_c that centers the mpg data by subtracting the mean value of mpg from every value in the data frame

mtcars |>
  select(mpg) |>
  mutate(mpg_c = mpg - mean(mpg)) # now the mean will be 0 

# challenge: create a new column called value that applies that applies the label good to cars that get over 18 mpg 
# and label bad to cars that get 18 mpg or less

mtcars |>
  select(mpg) |>
  mutate(value = if_else(mpg > 18, "good", "bad"))

args(if_else) # explains the argument of a function 


# create a new column called "opinion"
# if mpg is greater than 20 then "good"
# if mpg is less than 20 but greater than 15 then "meh"
# if mpg less than 15, then "bad"

mtcars |> 
  select(mpg) |>
  mutate(
    opinion = case_when(
    mpg > 20 ~ "good",
    mpg < 20 & mpg > 15 ~ "meh",
    mpg <= 15 ~ "bad"
    )
  )


# Summarize
# calculate the mean value of mpg in the dataset mtcars
mtcars |>
  summarize(avg = mean(mpg))

# calculate the mean value of mpg as a function of cyl
mtcars |>
  group_by(cyl) |>
  summarize(avg = mean(mpg))

# calculate the mean, SD, min, and max of mpg as a function of cyl
mtcars |>
  group_by(cyl) |>
  summarize(
    avg = mean(mpg),
    std = sd(mpg),
    mn = min(mpg),
    mx = max(mpg)
  )





