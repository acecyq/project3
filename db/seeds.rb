# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)










# run rails db:drop, db:create and db:migrate
# sign up 4 users before running this seed file

Lawyer.create(name: "Law1", number: "12345678", description: "Lawyer number 1", photo: "https://www.koreaboo.com/wp-content/uploads/2017/09/songjoongki1.jpg", firm: "LawOne Pte Ltd", address: "1 Claymore Hill", user_id: 1)
Lawyer.create(name: "Law2", number: "87654321", description: "Lawyer number 2", photo: "https://showtimelive.co.uk/wp-content/uploads/2018/05/Sean-Paul-High-Definition-Wallpapers-.jpg", firm: "LawOne Pte Ltd", address: "2 Claymore Hill", user_id: 2)
Client.create(name: "Client1", number: "97487234", user_id: 3)
Client.create(name: "Client2", number: "92328737", user_id: 4)
Case.create(title: "Case1", specialization: "Accident", description: "Accident 1", client_id: 1)
Case.create(title: "Case2", specialization: "Arbitration", description: "Arbitration 1", client_id: 2)

specializations = [
	"Accidents",
	"Arbitration",
	"Banking and Finance",
	"Bribery and Anti-Corruption",
	"Business Crime and Fraud"
]
specializations.each do |s|
	Specialization.create(name: s)
end

Specialization.find(1).lawyers << Lawyer.find(1)
Specialization.find(2).lawyers << Lawyer.find(2)