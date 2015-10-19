desc "This task is called by the Heroku scheduler add-on"
task :remove_old_data => :environment do
  puts "Removing..."
  Authorization.delete_all("created_at < '#{60.days.ago}' OR updated_at < '#{3.days.ago}'")
  puts "done."
end
