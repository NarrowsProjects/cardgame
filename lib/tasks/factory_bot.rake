namespace :factory_bot do
  desc "Verify that all FactoryBot factories are valid"

  task lint: :environment do
    if Rails.env.test?
      ActiveRecord::Base.connection.transaction do
        FactoryBot.factories.each do |factory|
          FactoryBot.create(factory.name)
          puts "Factory #{factory.name} is valid."
        rescue StandardError => e
          puts "Factory #{factory.name} failed: #{e.message}"
        end
        raise ActiveRecord::Rollback
      end
    else
      system("bundle exec rake factory_bot:lint RAILS_ENV=test")
      raise if $?.exitstatus.nonzero?
    end
  end
end
