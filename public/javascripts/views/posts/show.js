var updateCommentability = function(content) {
  if (content.length > 0) {
    $("comment_submit").disabled = false;
  } else {
    $("comment_submit").disabled = true;
  }
}