# Load R's "USPersonalExpenditure" dataset using the "data()" function
# This will produce a data frame called `USPersonalExpenditure`
data("USPersonalExpenditure")
View(USPersonalExpenditure)
# The variable USPersonalExpenditure is now accessible to you. Unfortunately,
# it's not a data frame (it's actually what is called a matrix)
# Test this using the `is.data.frame()` function
is.data.frame(USPersonalExpenditure)

# Luckily, you can simply pass the USPersonalExpenditure variable as an argument
# to the `data.frame()` function to convert it a data farm. Do this, storing the
# result in a new variable
uspersonal.expenditure <- data.frame(USPersonalExpenditure)

# What are the column names of your dataframe?
View(uspersonal.expenditure)
colnames(uspersonal.expenditure)
X1940, X1945, X1950, X1955, X1960
# Why are they so strange? Think about whether you could use a number like 1940
# with dollar notation!
uspersonal.expenditure$X1940
# What are the row names of your dataframe?
row.names(uspersonal.expenditure)


# Create a column "category" that is equal to your rownames
uspersonal.expenditure$category <- row.names(uspersonal.expenditure)

# How much money was spent on personal care in 1940?
uspersonal.expenditure["Personal Care", "X1940"]

# How much money was spent on Food and Tobacco in 1960?
uspersonal.expenditure["Food and Tobacco", "X1960"]

# What was the highest expenditure category in 1960?
# Hint: use the `max()` function to find the largest, then compare that to the column
max(uspersonal.expenditure$X1960)
uspersonal.expenditure[uspersonal.expenditure$X1960== max(uspersonal.expenditure$X1960), "category"]

# Define a function `DetectHighest` that takes in a year as a parameter, and
# returns the highest spending category of that year
DetectHighest <- function(year) {
  what.year <- paste0("X", year)
  uspersonal.expenditure[uspersonal.expenditure$what.year== max(uspersonal.expenditure$what.year), "category"]
}
DetectHighest(1950)
# Using your function, determine the highest spending category of each year
