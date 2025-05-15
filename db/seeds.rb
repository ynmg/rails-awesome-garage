# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Car.destroy_all
Owner.destroy_all
# if put Owner.destroy_all first, it will break as it fails if cars exist

puts "Creating owners..."
james = Owner.create!(nickname: "jimi")
grace = Owner.create!(nickname: "gracey")
mochi = Owner.create!(nickname: "mochi")

puts "Creating cars..."
car1 = Car.create!(brand: "BMW", model: "MINI Cooper", year: 2021, fuel: "E10 petrol", owner: james)
car2 = Car.create!(brand: "Tesla", model: "Y", year: 2025, fuel: "electricity", owner: grace)
car3 = Car.create!(brand: "Audi", model: "Q4", year: 2025, fuel: "electricity", owner: mochi)
puts "#{Owner.count} owners created & #{Car.count} cars created!"
