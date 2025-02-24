#ShinyUI Modules

#MODULE THAT GENERATES UI FOR THE SHINYAUTHR LOGIN MODULE
#' @export
login_basic_card <-function (){
  bslib::card(
    style="background-color: transparent; border-color: transparent;",
  shinyauthr::loginUI(
    id = "login",
    title="",
    user_title = "Usuario",
    pass_title = "Contraseña",
    login_title = "Acceder",
    error_message = "El Usuario/Contraseña especificado no es válido")
)
}