
# depois de carregar a pagina
$(document).on 'turbolinks:load', ->
#focus out
  $('.update_campaign input').bind 'blur', ->
    $('.update_campaign').submit()

  #aguarda o evento submit do form
  $('.update_campaign').on 'submit', (e) ->
    $.ajax e.target.action,
        type: 'PUT'
        dataType: 'json',
        data: $(".update_campaign").serialize() #pega todos os campos e serializa-os
        success: (data, text, jqXHR) ->
          Materialize.toast('Campanha atualizada', 4000, 'green')
        error: (jqXHR, textStatus, errorThrown) ->
          Materialize.toast('Problema na atualização da Campanha', 4000, 'red')
    #retorna falso para não enviar novamente o form ao recarregar a página
    return false

  $('.remove_campaign').on 'submit', (e) ->
    $.ajax e.target.action,
        type: 'DELETE'
        dataType: 'json',
        data: {}
        success: (data, text, jqXHR) ->
          $(location).attr('href','/campaigns');
        error: (jqXHR, textStatus, errorThrown) ->
          Materialize.toast('Problema na remoção da Campanha', 4000, 'red')
    return false

  $('.raffle_campaign').on 'submit', (e) ->
    $.ajax e.target.action,
        type: 'POST'
        dataType: 'json',
        data: {}
        success: (data, text, jqXHR) ->
          Materialize.toast('Tudo certo, em breve os participantes receberão um email!', 4000, 'green')
        error: (jqXHR, textStatus, errorThrown) ->
          #mostra a mensagem do backend (metodo raffle)
          Materialize.toast(jqXHR.responseText, 4000, 'red')
    return false