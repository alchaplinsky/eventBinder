class window.EventBinder
  events: {}
 
  constructor: (el=document) ->
    @el = el
    @bindEvents()
    @initialize if @initialize?
   
  bindEvents: =>
    @attachEvent(event, callback) for event, callback of @events
   
  attachEvent: (event, callback) =>
    if event.match(/:/)
      bind = event.split(':')
      $(@el).on bind[0], bind[1], (event) =>
        @[callback](collectEventData(event))
    else
      @subscribe(event, callback)
     
  collectEventData = (event) =>
    event.preventDefault()
    data = $(event.target).data()
    data.target = event.target
    data
     
  subscribe: (event, callback) =>
    $(document).on event, (event) =>
      @[callback](collectEventData(event))
     
  publish: (event, data = null) =>
    $(document).trigger(event, data)
