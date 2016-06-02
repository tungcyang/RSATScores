# Store the current directory
initialdir.dir <- getwd()

# Fixed Parameters for SAT Test
minSATscore <- 0
maxSATscore <- 2400

# Loading the SAT data
SATPercentileRank <- read.table("SATPercentileRanks.txt")
# Adding the column labels
names(SATPercentileRank) = c("Scores", "MF", "MFPercentile",
                             "Males", "MalePercentile",
                             "Females", "FemalePercentile")

# Plotting the SAT scores for all students, male only, and female only.
lowerSATscore <- min(SATPercentileRank$Scores)
upperSATscore <- max(SATPercentileRank$Scores)
scores <- seq(lowerSATscore, upperSATscore, by = 10)
plot(scores, SATPercentileRank$MF, type = "l",
     xlab = "SAT Scores", ylab = "",
     main = "2013 SAT Percentile Ranks",
     col = "green",
     xlim = c(minSATscore, maxSATscore))
lines(scores, SATPercentileRank$Males, col = "blue")
lines(scores, SATPercentileRank$Females, col = "pink")

# Adding legends to the plot
legend(x = "topleft",
       legend = c("Green Line: Both Genders",
                  "Pink Line: Female",
                  "Blue Line: Male"),
       col = c("green", "pink", "blue"),
       lwd = 1, lty = c(1, 1, 1), pch = c(".", ".", "."))

# We are done and change back to the original directory
setwd(initialdir.dir)