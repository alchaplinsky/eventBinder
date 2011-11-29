window.PubSub = {
  
  events:["click", "dblclick", "mouseover", "mouseout", "change", "blur", "focus", "submit", "keydown", "keyup", "keypress"],
  
  init: function(){
    var actions = PubSub.events
    for (var i in actions){
      var action = actions[i]
      this.watch(action);
    }
  },
  
  watch: function(action){
    self=this;
    $(document).on(action, '['+action+']', function(){
      var event = $(this).attr(action);
      var data = $(this).data();
      data.publisher = $(this);
      self.publish(event, data);
    });
  },
  
  publish: function(name, data){
    $(document).trigger(name, data);
  },
  
  subscribe: function(name, callback){
    $(document).bind(name, function(event, data) {
      callback(data);
      return true;
    });
  }
}