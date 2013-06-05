# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Admin User

admin = User.create!(email: 'admin@example.com', password: 'password')
admin.update_attribute('admin', true)

# Regular user

user = User.create!(email: 'user@example.com', password: 'password')

# Two Pings not in alert

ping1 = PingMonitor.new(hostname:'nykida.net')
bm1 = ping1.build_BaseMonitor(name: 'nykida.net ping', description: 'Working ping monitor')
ping1.save
user.BaseMonitors << bm1

ping2 = PingMonitor.new(hostname:'google.com')
bm2 = ping2.build_BaseMonitor(name: 'google ping', description: 'Working Ping Monitor')
ping2.save
user.BaseMonitors << bm2

# One Ping in alert that will resolve itself when backgroudn processes works 

ping3 = PingMonitor.new(hostname:'127.0.0.1')
bm3 = ping3.build_BaseMonitor(name: 'localhost ping', description: 'My alert will go away after background monitoring is working')
ping3.save
user.BaseMonitors << bm3
bm3.alerts << Alert.new
