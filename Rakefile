# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require 'csv'
require_relative 'config/environment'
require_relative 'config/application'

desc "Importing all CSV files"
task :import_all do
  OPTIONS = {headers: true, header_converters: :symbol}

  CSV.foreach('db/data/items.csv', OPTIONS) do |row|
    Item.create(row.to_h)
  end

  CSV.foreach('db/data/invoices.csv', OPTIONS) do |row|
    Invoice.create(row.to_h)
  end

  CSV.foreach('db/data/merchants.csv', OPTIONS) do |row|
    Merchant.create(row.to_h)
  end
end

Rails.application.load_tasks
