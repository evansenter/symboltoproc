ActionView::Helpers::AssetTagHelper.register_javascript_include_default([
  "behaveJS",
  "behaveJS_application"
])

ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion({
  :defaults => [
    "reset",
    "main"
  ]
})