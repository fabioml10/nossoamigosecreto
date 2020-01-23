#inicializar nav-bar hamburger (ver materialize)
$(document).on 'turbolinks:load', ->
  $('.button-collapse').sideNav()
  return