# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  text_div = _.template('<div class="text_comments_<%= id %>"><%= comments %></div><br><br>')
  photo_div = _.template('<div class="photo_comments_<%= id %>"></div>')
  $('#photo_submit').click (event) ->
    event.preventDefault()

    $title = $('#photo_post_title')
    $url = $('#photo_post_url')
    photo_post =
      photo_post:
        title: $title.val()
        url: $url.val()

    $.post("/photo_posts", photo_post).done (data) ->
      photo_html = '<p><strong>' + data["title"] + '</strong></p><p><img src="'+ data["url"] + '"></p><br>'
      photo_comments = photo_div(data)
      $('#posts').prepend(photo_html + photo_comments)

    $title.val("")
    $url.val("")

  $('#text_submit').click (event) ->
    event.preventDefault()

    $title = $('#text_post_title')
    $content = $('#text_post_content')
    text_post =
      text_post:
        title: $title.val()
        content: $content.val()

    $.post("/text_posts", text_post).done (data) ->
      text_html = '<p><strong>' + data["title"] + '</strong></p><p>'+ data["content"] + '</p><button class="text_button_' + data["id"] + '" onclick="#">Comments</button><br>'
      text_comments = text_div(data)
      $('#posts').prepend(text_html + text_comments)

    $title.val("")
    $content.val("")

  $.get("/posts.json").done (data) ->
    _.each data, (item) ->
      debugger
      item_keys = _.keys item
      if _.contains item_keys, "content"
        text_html = '<p><strong>' + item["title"] + '</strong></p><p>'+ item["content"] + '</p><button class="text_button" id="text_button_' + data["id"] + '" onclick="#">Comments</button><br>'
        text_comments = text_div(item)
        $('#posts').prepend(text_html + text_comments)
      else
        photo_html = '<p><strong>' + item["title"] + '</strong></p><p><img src="'+ item["url"] + '"></p><br>'
        photo_comments = photo_div(item)
        $('#posts').prepend(photo_html + photo_comments)

  # $.on 'click', 'button[class="text_button"]', (event) ->

