# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)










# run rails db:drop, db:create and db:migrate
# all users have banana passwords


User.create(email: 'shaun@gmail.com', password: 'banana', password_confirmation: 'banana')
User.create(email: 'vinny@gmail.com', password: 'banana', password_confirmation: 'banana')
User.create(email: 'ace@gmail.com', password: 'banana', password_confirmation: 'banana')
User.create(email: 'akira@gmail.com', password: 'banana', password_confirmation: 'banana')
User.create(email: 'leon@gmail.com', password: 'banana', password_confirmation: 'banana')
User.create(email: 'julian@gmail.com', password: 'banana', password_confirmation: 'banana')
User.create(email: 'sam@gmail.com', password: 'banana', password_confirmation: 'banana')
User.create(email: 'jay@gmail.com', password: 'banana', password_confirmation: 'banana')


Lawyer.create(name: "Law1", number: "83242383", description: "Lawyer number 1", photo: "https://www.koreaboo.com/wp-content/uploads/2017/09/songjoongki1.jpg", firm: "LawOne Pte Ltd", address: "1 Claymore Hill", user_id: 1)
Lawyer.create(name: "Law2", number: "87654321", description: "Lawyer number 2", photo: "https://showtimelive.co.uk/wp-content/uploads/2018/05/Sean-Paul-High-Definition-Wallpapers-.jpg", firm: "LawTwo Pte Ltd", address: "2 Claymore Hill", user_id: 2)
Lawyer.create(name: "Law3", number: "92347892", description: "Lawyer number 3", photo: "https://www.grammy.com/sites/com/files/styles/image_landscape_hero/public/brunomars-hero_0.jpg?itok=NxVLunrf", firm: "LawThree Pte Ltd", address: "3 Claymore Hill", user_id: 3)
Lawyer.create(name: "Law4", number: "97897834", description: "Lawyer number 4", photo: "https://cdn.images.dailystar.co.uk/dynamic/58/photos/976000/620x/Lionel-Messi-718661.jpg", firm: "LawFour Pte Ltd", address: "4 Claymore Hill", user_id: 4)
Client.create(name: "Client1", number: "82768347", user_id: 5)
Client.create(name: "Client2", number: "82347264", user_id: 6)
Client.create(name: "Client3", number: "82746827", user_id: 7)
Client.create(name: "Client4", number: "83746284", user_id: 8)
Case.create(title: "Case1", specialization: "Accidents", description: "Accident 1", client_id: 1)
Case.create(title: "Case2", specialization: "Arbitration", description: "Arbitration 1", client_id: 2)
Case.create(title: "Case3", specialization: "Banking and Finance", description: "Banking and Finance 1", client_id: 3)
Case.create(title: "Case4", specialization: "Bribery and Anti-Corruption", description: "Bribery and Anti-Corruption 1", client_id: 4)
Case.create(title: "Case5", specialization: "Construction", description: "Construction 1", client_id: 1)
Case.create(title: "Case6", specialization: "Contracts", description: "Contracts 1", client_id: 2)
Case.create(title: "Case7", specialization: "Corporate and Commercial", description: "Corporate and Commercial 1", client_id: 3)
Case.create(title: "Case8", specialization: "Criminal Defence", description: "Criminal Defence 1", client_id: 4)

specializations = [
	"Accidents",
	"Arbitration",
	"Banking and Finance",
	"Bribery and Anti-Corruption",
	"Business Crime and Fraud",
	"Construction",
	"Contracts",
	"Corporate and Commercial",
	"Criminal Defence",
	"Debt Recovery",
	"Employment and Benefits (Businesses)",
	"Employment and Benefits (Individuals)",
	"Environmental Law",
	"Family and Matrimonial",
	"Financial Services",
	"Immigration",
	"Insolvency (Personal)",
	"Insurance (Businesses)",
	"Insurance (Individuals)",
	"Intellectual Property",
	"International Arbitration",
	"Investment Funds (Businesses)",
	"Mediation (Businesses)",
	"Shipping and Maritime",
	"Tax",
	"Technology, Media and Telecoms",
	"Wealth Management",
	"Wills, Probate and Trusts"
]
specializations.each do |s|
	Specialization.create(name: s)
end

Specialization.find(1).lawyers << Lawyer.find(1)
Specialization.find(4).lawyers << Lawyer.find(1)
Specialization.find(2).lawyers << Lawyer.find(2)
Specialization.find(3).lawyers << Lawyer.find(2)
Specialization.find(5).lawyers << Lawyer.find(3)
Specialization.find(7).lawyers << Lawyer.find(3)
Specialization.find(6).lawyers << Lawyer.find(4)
Specialization.find(8).lawyers << Lawyer.find(4)