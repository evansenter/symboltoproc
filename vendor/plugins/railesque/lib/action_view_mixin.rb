ActionView::Helpers::AssetTagHelper.register_javascript_include_default([
  "ckeditor/ckeditor",
  "underscore",
  "prettify",
  "behaveJS",
  "behaveJS_application"
])

ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion({
  :defaults => [
    "reset",
    "prettify",
    "main"
  ]
})