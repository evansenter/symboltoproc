Event.observe(document, "dom:loaded", function() {
  _.each($$("textarea"), function(textarea) {
    CKEDITOR.replace(textarea.id);
  });
});