#Server.R
server <- function(input, output, session) {
  
  #Avoid Messing with browser buttons
  shinyjs::disable(selector = '.navbar-nav a')
  
  #Hiding main tab before login
  nav_hide("main_page", "Home", session = getDefaultReactiveDomain())
  
  # hack to add the logout button to the navbar on app launch 
  insertUI(
    selector = ".navbar .container-fluid .navbar-collapse",
    ui = tags$ul(
      class="nav navbar-nav navbar-right",
      tags$li(
        div(
          style = "padding: 10px; padding-top: 8px; padding-bottom: 0;",
          shinyauthr::logoutUI("logout")
        )
      )
    )
  )
  
  # call Shinyauthr Login module supplying data frame, user and password cols and reactive trigger
  credentials <- shinyauthr::loginServer(
    id = "login",
    data = user_base,
    user_col = "user",
    pwd_col = "password",
    sodium_hashed = TRUE,
    reload_on_logout = TRUE,
    log_out = reactive(logout_init())
  )
  
  # Call the logout module with reactive trigger to hide/show
  logout_init <- shinyauthr::logoutServer(
    id = "logout",
    active = reactive(credentials()$user_auth)
  )
  
  #Login / Logout Server Logic
  observeEvent(credentials()$user_auth, {
    # if user logs in successfully
    if (credentials()$user_auth) { 
      nav_show("main_page","Home", select = TRUE, session = getDefaultReactiveDomain())
      # remove the login tab
      nav_hide("main_page", "Login", session = getDefaultReactiveDomain())
    }
  })
  
  #Go back to the home tab after logout
  observe({
    if(credentials()$user_auth==F){
      nav_hide("main_page", "Home", session = getDefaultReactiveDomain())
      nav_show("main_page","Acceso", select = TRUE, session = getDefaultReactiveDomain())
    }
  })
  

# VARIABLE SECTION (App Specific Outputs start here) ----------------------

  #EXAMPLE OUTPUT
      # output$chart <- renderPlot({
      #hist(1:100)
      # })
      
}