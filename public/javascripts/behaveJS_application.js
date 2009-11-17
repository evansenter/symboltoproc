// Create Application controller, You can add whatever you like to it, just don't remove it!
behaveJS.createController("Application", {
 initialize : function() {
	_.each($$("textarea"), function(element) {
    CKEDITOR.replace(element);
  });
	 }
});

// Add your Behaviors here
behaveJS.addBehaviors({});

// Add your RemoteActions here
behaveJS.addRemoteActions({});