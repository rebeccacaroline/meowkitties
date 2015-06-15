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
  candidates = line.split("|,|")

  cand_office = candidates[5]
  district_id = candidates[5].slice(0..1)
  cand_state = district_id unless district_id == "PR"
  if cand_office == "PRES"
    cand_office = "PRES"
  elsif cand_office[2] == "S"
    cand_office = "Senator"
  else
    cand_office = "Representative"
  end
  Politician.create({name: candidates[3], cid: candidates[2], party: candidates[4], office: cand_office, state: cand_state})
}
my_file.close