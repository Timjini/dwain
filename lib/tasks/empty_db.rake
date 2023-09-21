namespace :db do
    desc "Empty the database"
    task empty: :environment do
      ActiveRecord::Base.connection.tables.each do |table|
        ActiveRecord::Base.connection.execute("TRUNCATE #{table} RESTART IDENTITY CASCADE")
      end
    end
  end
  