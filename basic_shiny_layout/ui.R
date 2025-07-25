#ui.R

#Theme & Color adjustments
PRIMARY <- vector_of_colors[1]
SECONDARY <- vector_of_colors[2]

theme_usar <- 
  bs_theme(
    bootswatch = "quartz",  #bootswatch_themes() for possible options
    #"bg" = "#101010",
    #"fg" = "#FDF7F7",
    base_font = font_collection(font_google("Raleway", local = TRUE), "Roboto", "sans-serif"),
    "primary" = PRIMARY,
    "secondary" = SECONDARY,
    "navbar-bg" = PRIMARY,
    font_scale = 0.7
  )

# login tab ui to be rendered on launch
main_log <- layout_column_wrap(
  width = 1, heights_equal = "row",
  module_shinyUI$login_basic_card()
  )

#Defining an example bslib Card
main_results_card <- navset_card_pill(
  title = "Awesome Card",
  full_screen = TRUE,
  nav_panel(
    "First Card Tab",
    br(),
    class="bg-light",
  ),
  nav_panel(
    "Second Card Tab",
    br(),
    class="bg-light",
  )
)

#Integration of Example Card
main_cards <- layout_column_wrap(width=1, heights_equal = "row",
  layout_column_wrap(
    width = NULL, fill = FALSE,
    style = css(grid_template_columns = "3fr 1fr"),
    main_results_card,
    layout_column_wrap(width=1, fill=FALSE, heights_equal = "all",
    br()
    ))
)

ui <- page_navbar(
  id="main_page",
  fluid = TRUE,
  theme = theme_usar,
  title = tags$span(
    tags$img(
      src = "logo.png",
      style = "width:32px;height:auto;margin-right:24px;"
    ),
    #Dashboard Title
    "Example TITLE"
  ),
  nav_panel("Login",main_log,icon=icon("shield"),
  #THIS SPECIFIC TAG WILL CHANGE THE BACKGROUND-IMAGE WITH A GRADIENT (FIRST COMMENTED LINE) OR PIC
  tags$style(
        "body{
        #background-image: linear-gradient(90deg, #8b9dc3, #3b5998, #0b111e);
        background-image: url('Background.jpg');
  }"),
  tags$head(
    tags$style(HTML("
     .selectize-dropdown-content{
       background: #7fa9d0 !important;
     }
  "))
  )
      ),
  nav_panel("Home",icon=icon("desktop"),
      navset_pill(
        #FIRST TAB --
        nav_panel(title="Tab 1",
            br(),
            main_cards),
      #SECOND TAB --
      nav_panel(title="Tab 2",
          br()
          )
      )
  ),
  nav_spacer()
)