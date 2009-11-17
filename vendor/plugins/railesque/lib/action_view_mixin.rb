ActionView::Helpers::AssetTagHelper.register_javascript_include_default([
  "behaveJS",
  "behaveJS_application",
  "ckeditor/ckeditor",
  "underscore",
  "prettify"
])

ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion({
  :defaults => [
    "reset",
    "prettify",
    "main"
  ]
})