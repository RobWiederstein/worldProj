# install packages
ip <- function(pkg, ...){
    install.packages(pkg)
}
# deploy app
da <- function(...){
  rsconnect::deployApp()
}
