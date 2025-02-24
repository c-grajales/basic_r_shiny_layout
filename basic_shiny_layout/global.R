#global.R

# SETUP -------------------------------------------------------------------
library("shiny")
library("bslib")
library("bsicons")
library("shinyauthr")
library("shinyWidgets")
library("htmltools")
#Using box to load required modules (Highly recommended to modularize code this way)
box::use(modules/module_shinyUI)
box::use(modules/module_example)

# user database for login module
#CURRENTLY HARD CODED (NOT RECOMMENDED) YOU SHOULD CREATE THIS DF 
#AND STORE IT AS A HASHED FILE WITH SODIUM
user_base <- tibble::tibble(
  user = c("example_user1", "example_user2"),
  password = purrr::map_chr(c("first_password_to_hash", "second_password_to_hash"), sodium::password_store),
  permissions = c("admin", "standard"),
  name = c("User One", "User Two")
)

# SYSTEM PARAMETERS -------------------------------------------------------
#Vector of colors to be used for overall image (can be edited as desired)
vector_of_colors <- c("#255d8f","#7fa9d0","#bde0ff","#e0d5f7","#ffe7ce","#fff4d3")
