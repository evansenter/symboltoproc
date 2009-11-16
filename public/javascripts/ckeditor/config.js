/*
Copyright (c) 2003-2009, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function(config) {
  config.PreserveSessionOnFileBrowser = true;
  
  config.uiColor = "#eee";
  config.resize_enabled = false;
  config.toolbar = "blog_post";
 
  config.toolbar_blog_post = [
    ["Undo", "Redo"],
    ["Bold", "Italic", "Underline", "Strike"],
    ["NumberedList", "BulletedList", "Outdent", "Indent", "Blockquote"],
    ["Link", "Unlink", "Image"],
    ["NumberedList", "BulletedList"]
    ["SpellChecker", "Scayt"],
    ["SelectAll", "RemoveFormat", "ShowBlocks"],
    ["Styles"]
  ];
  
  config.stylesCombo_stylesSet = "code_style";
};
 
CKEDITOR.addStylesSet("code_style", [
  {
    name: "Default",
    element: "p"
  },
  {
    name: "Code snippet",
    element: "pre",
    attributes: { "class": "prettyprint" }
  }
]);