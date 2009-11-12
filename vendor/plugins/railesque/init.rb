ruby_file_pattern = File.join(File.dirname(__FILE__), "lib", "**", "*.rb")

Dir.glob(ruby_file_pattern).each do |file_path|
  require file_path
end