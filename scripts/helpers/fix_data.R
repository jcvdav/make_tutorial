######################################################
#                fix fish data                       #
######################################################
# 
# This function is a wraper around get_data. It calls
# it with a different list of species to simulate a
# fix of the data.
#
######################################################

fix_data <- function(fish = c("red fish", "green fish"), ...) {
  get_data(fish = fish, ...)
}
