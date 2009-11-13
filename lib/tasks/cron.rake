task :cron => :environment do
  puts "Destroying old bundle:"
  puts `heroku bundles:destroy evansenter`

  puts "Creating new bundle:"
  puts `heroku bundles:capture evansenter --app=evansenter`
  
  puts "Current bundles:"
  puts `heroku bundles`
end
