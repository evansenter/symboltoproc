behaveJS.createController("Application", {
 initialize : function() {
  	_.each($$("textarea"), function(element) {
      CKEDITOR.replace(element);
    });
  }
});

behaveJS.addBehaviors({});

behaveJS.addRemoteActions({});