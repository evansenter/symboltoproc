behaveJS.addRemoteActions({
  commentsForPost : function(response) {
    var data = response.responseJSON;

    $(data.div).innerHTML = data.comments;
  }
});