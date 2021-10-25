####################
#                  #
# Copiar todo esto #
#                  #
####################
# Hecho con gusto por Yunuén Hernández Álvarez (UAEH)



###### ECONGEO ######

#install.packages("devtools")
library(devtools)
#devtools::install_github("PABalland/EconGeo", force = T)
library (EconGeo)



###### Example #4: PLOT A HOOVER CURVE ######
# This function plots a Hoover curve from regions - industries matrices following Hoover (1936).


## generate vectors of industrial and population count
ind <- c(0, 10, 10, 30, 50)
pop <- c(10, 15, 20, 25, 30)

# check the ind vector
ind

# check the pop vector
pop

## run the function (30% of the population produces 50% of the industrial output)
Hoover.curve (ind, pop)

# compute the corresponding Hoover Gini
Hoover.Gini (ind, pop)



###### COMPUTE THE GINI COEFFICIENT ######
# This function computes the Gini coefficient. The Gini index measures spatial inequality. It ranges
# from 0 (perfect income equality) to 1 (perfect income inequality) and is derived from the Lorenz
# curve. The Gini coefficient is defined as a ratio of two surfaces derived from the Lorenz curve.
# The numerator is given by the area between the Lorenz curve of the distribution and the uniform
# distribution line (45 degrees line). The denominator is the area under the uniform distribution line
# (the lower triangle). This index gives an indication of the unequal distribution of an industry accross
# n regions. Maximum inequality in the sample occurs when n-1 regions have a score of zero and one
# region has a positive score. The maximum value of the Gini coefficient is (n-1)/n and approaches 1
# (theoretical maximum limit) as the number of observations (regions) increases.

# Examples

## generate vectors of industrial count
ind <- c(0, 10, 10, 30, 50)

## run the function
Gini (ind)

## generate a region - industry matrix
mat = matrix (
  c (0, 1, 0, 0,
     0, 1, 0, 0,
     0, 1, 0, 0,
     0, 1, 0, 1,
     0, 1, 1, 1), ncol = 4, byrow = T)
rownames(mat) <- c ("R1", "R2", "R3", "R4", "R5")
colnames(mat) <- c ("I1", "I2", "I3", "I4")

## run the function
Gini (mat)

## run the function by aggregating all industries
Gini (rowSums(mat))

## run the function for industry #1 only (perfect equality)
Gini (mat[,1])

## run the function for industry #2 only (perfect equality)
Gini (mat[,2])

## run the function for industry #3 only (perfect unequality: max Gini = (5-1)/5)
Gini (mat[,3])

## run the function for industry #4 only (top 40% produces 100% of the output)
Gini (mat[,4])



###### COMPUTE THE HOOVER GINI ######
# This function computes the Hoover Gini, named after Hedgar Hoover. The Hoover index is a
# measure of spatial inequality. It ranges from 0 (perfect equality) to 1 (perfect inequality) and is
# calculated from the Hoover curve associated with a given distribution of population, industries or
# technologies and a reference category. In this sense, it is closely related to the Gini coefficient and
# the Hoover index. The numerator is given by the area between the Hoover curve of the distribution
# and the uniform distribution line (45 degrees line). The denominator is the area under the uniform
# distribution line (the lower triangle).

# Examples

## generate vectors of industrial and population count
ind <- c(0, 10, 10, 30, 50)
pop <- c(10, 15, 20, 25, 30)

## run the function (30% of the population produces 50% of the industrial output)
Hoover.Gini (ind, pop)

## generate a region - industry matrix
mat = matrix (
  c (0, 10, 0, 0,
     0, 15, 0, 0,
     0, 20, 0, 0,
     0, 25, 0, 1,
     0, 30, 1, 1), ncol = 4, byrow = T)
rownames(mat) <- c ("R1", "R2", "R3", "R4", "R5")
colnames(mat) <- c ("I1", "I2", "I3", "I4")

## run the function
Hoover.Gini (mat, pop)

## run the function by aggregating all industries
Hoover.Gini (rowSums(mat), pop)

## run the function for industry #1 only
Hoover.Gini (mat[,1], pop)

## run the function for industry #2 only (perfectly proportional to population)
Hoover.Gini (mat[,2], pop)

## run the function for industry #3 only (30% of the pop. produces 100% of the output)
Hoover.Gini (mat[,3], pop)

## run the function for industry #4 only (55% of the pop. produces 100% of the output)
Hoover.Gini (mat[,4], pop)



###### COMPUTE THE LOCATIONAL GINI COEFFICIENT FROM REGIONS - INDUSTRIES MATRICES #####
# This function computes the locational Gini coefficient as proposed by Krugman from regions -
# industries matrices. The higher the coefficient (theoretical limit = 0.5), the greater the industrial
# concentration. The locational Gini of an industry that is not localized at all (perfectly spread out) in
# proportion to overall employment would be 0.

# Examples

## generate a region - industry matrix
mat = matrix (
  c (100, 0, 0, 0, 0,
     0, 15, 5, 70, 10,
     0, 20, 10, 20, 50,
     0, 25, 30, 5, 40,
     0, 40, 55, 5, 0), ncol = 5, byrow = T)
rownames(mat) <- c ("R1", "R2", "R3", "R4", "R5")
colnames(mat) <- c ("I1", "I2", "I3", "I4", "I5")

## run the function
locational.Gini (mat)



###### PLOT A LOCATIONAL GINI CURVE FROM REGIONS - INDUSTRIES MATRICES #####
# This function plots a locational Gini curve following Krugman from regions - industries matrices.

# Examples

## generate a region - industry matrix
mat = matrix (
  c (100, 0, 0, 0, 0,
     0, 15, 5, 70, 10,
     0, 20, 10, 20, 50,
     0, 25, 30, 5, 40,
     0, 40, 55, 5, 0), ncol = 5, byrow = T)
rownames(mat) <- c ("R1", "R2", "R3", "R4", "R5")
colnames(mat) <- c ("I1", "I2", "I3", "I4", "I5")

## run the function (shows industry #5)
locational.Gini.curve (mat)
locational.Gini.curve (mat, pdf = TRUE)



###### PLOT A LORENZ CURVE FROM REGIONAL INDUSTRIAL COUNTS #####
# This function plots a Lorenz curve from regional industrial counts. This curve gives an indication
# of the unequal distribution of an industry accross regions.

# Examples

## generate vectors of industrial count
ind <- c(0, 10, 10, 30, 50)

## run the function
Lorenz.curve (ind)
Lorenz.curve (ind, pdf = TRUE)
Lorenz.curve (ind, plot = FALSE)

## generate a region - industry matrix
mat = matrix (
  c (0, 1, 0, 0,
     0, 1, 0, 0,
     0, 1, 0, 0,
     0, 1, 0, 1,
     0, 1, 1, 1), ncol = 4, byrow = T)
rownames(mat) <- c ("R1", "R2", "R3", "R4", "R5")
colnames(mat) <- c ("I1", "I2", "I3", "I4")

## run the function
Lorenz.curve (mat)
Lorenz.curve (mat, pdf = TRUE)
Lorenz.curve (mat, plot = FALSE)

## run the function by aggregating all industries
Lorenz.curve (rowSums(mat))
Lorenz.curve (rowSums(mat), pdf = TRUE)
Lorenz.curve (rowSums(mat), plot = FALSE)

## run the function for industry #1 only (perfect equality)
Lorenz.curve (mat[,1])
Lorenz.curve (mat[,1], pdf = TRUE)
Lorenz.curve (mat[,1], plot = FALSE)

## run the function for industry #2 only (perfect equality)
Lorenz.curve (mat[,2])
Lorenz.curve (mat[,2], pdf = TRUE)
Lorenz.curve (mat[,2], plot = FALSE)

## run the function for industry #3 only (perfect unequality)
Lorenz.curve (mat[,3])
Lorenz.curve (mat[,3], pdf = TRUE)
Lorenz.curve (mat[,3], plot = FALSE)

## run the function for industry #4 only (top 40% produces 100% of the output)
Lorenz.curve (mat[,4])
Lorenz.curve (mat[,4], pdf = TRUE)
Lorenz.curve (mat[,4], plot = FALSE)

# Compare the distribution of the #industries
par(mfrow=c(2,2))
Lorenz.curve (mat[,1])
Lorenz.curve (mat[,2])
Lorenz.curve (mat[,3])
Lorenz.curve (mat[,4])
