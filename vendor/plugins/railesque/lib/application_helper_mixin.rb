module ApplicationHelper
  def method_missing_with_simple_partials(method_name, *args, &block)
    method_string = method_name.to_s

    if method_string =~ /^_.+$/
      partial_name = method_string[/^_(.+)$/, 1]
      
      begin
        concat_partial partial_name, *args, &block
      rescue ActionView::MissingTemplate
        partial_name = "shared/#{partial_name}"
        concat_partial partial_name, *args, &block
      end
    else
      method_missing_without_simple_partials method_name, *args, &block
    end
  end

  alias_method_chain :method_missing, :simple_partials

  def concat_partial(partial_name, options = {}, &block)
    options.merge!(:body => capture(&block)) if block_given?
    
    content = render :partial => partial_name, :locals => options
    concat content
  end
end