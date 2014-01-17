class UserLocationManagement.Views.YoutubeUrls extends Backbone.View
  template: JST["user_location_management/backbone/templates/youtube_urls"]

  render: ->
    @$el.html(@template());