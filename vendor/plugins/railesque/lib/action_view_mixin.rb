ActionView::Helpers::AssetTagHelper.register_javascript_include_default([
  "jquery-1.3.2",
  "ckeditor/ckeditor",
  "behaveJS",
  "behaveJS_application"
])

ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion({
  :defaults => [
    "reset",
    "main"
  ]
})