# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require('../CampaignFin16/cands16.txt')


f = 'CampaignFin16/cands16.txt'

my_file = File.open(f, "r")


my_file.each_line { |line|
  ap line.split("|,|")
}
my_file.close