namespace :cloudpress do
  desc "Update cloudpress"
  task :update => :environment do
    puts 'Updating cloudpress....'
    Cloudpress.update!
    puts 'Complete!'
  end
end