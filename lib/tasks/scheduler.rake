desc "This task is called by the Heroku scheduler add-on"
task :remove_old_data => :environment do
  puts "Removing..."
  Authorization.where("created_at < '#{60.days.ago}' OR updated_at < '#{2.days.ago}'").each do |model|
    Authorization.current_id = model.id
    model.destroy
  end
  puts "done."
end
