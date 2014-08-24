# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a fringilla nisl, at tempor urna. 
Donec porta lectus et augue pharetra, in laoreet lectus luctus. Nam vestibulum suscipit urna, ut volutpat diam
condimentum vehicula. Donec bibendum sapien quis nisi faucibus aliquam. Mauris faucibus sollicitudin quam, ac
suscipit ante sollicitudin id. Quisque sed magna a lorem viverra scelerisque sit amet scelerisque nulla. Donec
mauris sapien, accumsan sed pellentesque quis, consectetur mollis dui. Nulla accumsan hendrerit nulla nec
consectetur. Nulla facilisi. Morbi vel scelerisque sapien. Vivamus vitae congue justo, id sollicitudin orci.
Sed id ligula ut turpis pharetra pellentesque. Ut id dolor at lacus vehicula gravida eu vel ante. Nunc volutpat
pharetra bibendum. Nunc lacus sapien, egestas ut aliquam nec, vulputate laoreet odio. Pellentesque mollis lacinia
felis, sit amet vestibulum ante congue vel. Vivamus a ipsum sapien. Class aptent taciti sociosqu ad litora
torquent per conubia nostra, per inceptos himenaeos. Nam vestibulum est lorem, dapibus consequat purus convallis
id. Vivamus eget fermentum massa. Vestibulum feugiat libero eu tristique eleifend. In lobortis lectus eu lectus
mattis, nec rhoncus libero dictum. Maecenas euismod lorem sodales sagittis aliquam. Sed eleifend, augue vitae
tempus rutrum, nibh lacus hendrerit sem, non ullamcorper ipsum ipsum non lectus. Ut pellentesque condimentum
quam sit amet tincidunt. Suspendisse potenti. Donec hendrerit suscipit velit, eu pulvinar tortor dictum eget."

User.delete_all
User.create(first_name: "Mustafa Serhat", last_name: "Dündar", email: "msdundars@gmail.com", password: "12345678", admin: true)
User.create(first_name: "Ömer Faruk", last_name: "Er", email: "omfaer@bil.omu.edu.tr", password: "12345678")

Notice.delete_all
Notice.create(title: "Logitech HD Pro Webcam C920", message: lorem, user_id: User.find_by(email: "msdundars@gmail.com").id)
Notice.create(title: "Mikado MD-V6S 2+1 Multimedia Speaker", message: lorem, user_id: User.find_by(email: "omfaer@bil.omu.edu.tr").id)
Notice.create(title: "HP LaserJet Pro 400 Yazıcı M401dn", message: lorem, user_id: User.find_by(email: "msdundars@gmail.com").id)
Notice.create(title: "İlan 4", message: lorem, user_id: User.find_by(email: "msdundars@gmail.com").id)
Notice.create(title: "İlan 5", message: lorem, user_id: User.find_by(email: "omfaer@bil.omu.edu.tr").id)
Notice.create(title: "İlan 6", message: lorem, user_id: User.find_by(email: "msdundars@gmail.com").id)
Notice.create(title: "İlan 7", message: lorem, user_id: User.find_by(email: "msdundars@gmail.com").id)
Notice.create(title: "İlan 8", message: lorem, user_id: User.find_by(email: "omfaer@bil.omu.edu.tr").id)
Notice.create(title: "İlan 9", message: lorem, user_id: User.find_by(email: "msdundars@gmail.com").id)

City.delete_all
File.open("#{Rails.root}/db/cities.txt") do |cities|
  cities.read.each_line do |city|
    City.create!(:name => city.chomp)
  end
end

Category.delete_all
Category.create(name: "İş İlanları")
Category.create(name: "Ev Arkadaşı")
Category.create(name: "Kiralık Ev")
Category.create(name: "Ders Kitapları")
Category.create(name: "Eşya")
Category.create(name: "Diğer")