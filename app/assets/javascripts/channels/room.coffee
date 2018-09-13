App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append data['message']
    @isMyMessage($('.message__item:last-child'), data['user_id'])

  isMyMessage: (element, userId) ->
    element.addClass('is-mine') if @userIsCurrentUser(userId)

  userIsCurrentUser: (userId) ->
    userId is parseInt($('meta[name=current-user]').attr('id'))


  speak: (message) ->
    @perform 'speak', message: message, user: $('meta[name=current-user]').attr('id'), room: $('#messages').attr('data-room-id')

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    return if event.target.value == ''
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()

$(document).ready ->
  $('.message__item').each (i, message) ->
    App.room.isMyMessage $(this), $(this).data('user-id')
