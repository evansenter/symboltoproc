task :cron => :environment do
  puts "Destroying old bundle:"
  puts `heroku bundles:destroy evansenter --app=evansenter`

  puts "Creating new bundle:"
  puts `heroku bundles:capture evansenter --app=evansenter`
  
  sleep 5
  
  puts "Current bundles:"
  puts `heroku bundles --app=evansenter`
end
