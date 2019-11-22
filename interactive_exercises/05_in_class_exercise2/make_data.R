# Shiny class 5 example

# Make grouped data for scatterplot example

# Set seed so can reproduce exactly
set.seed(16)

# Three groups, 25 obs each
group = rep(letters[1:3],
             each = 25)

# Two variables from uniform dist
xvar = runif(n = 75, min = 0, max = 25)
yvar = runif(n = 75, min = 10, max = 20)

# Put in data.frame "dat"
dat = data.frame(group, xvar, yvar)

# Save into "scatterplot_app" folder within
     # root directory for shiny class 5
# Comment out for the sourcing example in 
     # interactive exercise
# write.csv(x = dat,
#           file = here::here("scatterplot_app", "scatter_dat.csv"),
#           row.names = FALSE)