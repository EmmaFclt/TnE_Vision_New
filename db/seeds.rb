# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Transaction.destroy_all
Report.destroy_all
Company.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?

p 'destroying previous data'


company=Company.create!(name:"Heineken", logo:"HK", address:"2 rue de Martinets")
User.create!(first_name:"Christian", last_name:"Preda", password:"123456", email:"christian@heineken.fr", company:company)

# report = Report.create(company: company, user: User.first, format: 'csv', submission_date: Date.today, source: 'Arval')

# require 'csv'

# filepath = File.join(Rails.root, 'db', 'transactions_seed.csv')
# csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
# CSV.foreach(filepath, csv_options) do |row|
#   # Here, row is an array of columns
#   p row
#   first_name = row[2].split(' ')[0]
#   last_name = row[2].split(' ')[1]
#   Transaction.create!(entity: row[0],
#     department: row[9],
#     traveller_first_name: first_name,
#     traveller_last_name: last_name,
#     traveller_email: "#{last_name}@heineken.com",
#     amount: row[7],
#     reservation_mode: row[8],
#     supplier: row[10],
#     transaction_type: row[5],
#     report: report,
#     compliancy: row[11] == 'TRUE',
#     service: row [13],
#     cities: row [12],
#     start_date: row[3],
#     end_date: row[4],
#     countries: row[14]
#     )
#   end


p 'data has been created'

