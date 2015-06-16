# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require('../CampaignFin16/cands16.txt')
  @contribution_collection = Hash.new


def parse_candidates

  f = 'CampaignFin16/cands16.txt'

  my_file = File.open(f)

  my_file.each_line do |line|
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

    Politician.create(
      {name: candidates[3],
       cid: candidates[2],
       party: candidates[4],
       office: cand_office,
       state: cand_state}
      )
  end
  my_file.close
end

# def parse_individual_contributions
#   f = 'CampaignFin16/indivs16.txt'
#   my_file = Figitle.open(f, encoding: 'windows-1252')
#   my_file.each_line do |line|
#     line = line.gsub(/\s\s+/, " ")
#     line = line.gsub(/\,\,+/, " ")
#     line = line.split("|,|")
#       line.each do |xyz|
#         if xyz[0] == "|" && xyz[-1] == "|"
#           xyz.slice!(0)
#           xyz.slice!(-1)
#         end
#       end
#       ap line
#   end
#   my_file.close
# end

# parse_individual_contributions

def parse_pac_contributions
  f = 'CampaignFin16/pacs16.txt'
  my_file = File.open(f)
  my_file.each_line do |line|
   lines = line.split(",")
   lines.each do |xyz|
    if xyz[0] == "|" && xyz[-1] == "|"
      xyz.slice!(0)
      xyz.slice!(-1)
    end
    pac = lines[2]
    candidate = lines[3]
    amount = lines[4]
    ap name = @contribution_collection[pac] if @contribution_collection[pac]
    end
  end
end



def parse_individuals
z = 'CampaignFin16/indivs16.txt'

your_file = File.open(z, encoding: 'windows-1252')
  your_file.each_line do |line|
  line = line.gsub(/\s\s+/, ' ')
  line = line.gsub(/\,\,+/, ' ')
  line = line.gsub(/\|/, "")
  line = line.strip
  line = line.split(',')
  line.each do |x|
    if x[0] == " "
        x[0] = ""
      end
   end
      ap line

  end
your_file.close
end

def parse_committees
  # @contribution_collection = Hash.new(0)
  file = 'CampaignFin16/cmtes16.txt'
  your_file = File.open(file, encoding: 'windows-1252')
  your_file.each_line {|line|
  line = line.gsub(/\s\s+/, ' ')
  # line = line.gsub(/\,\,+/, ' ')
  # line = line.gsub(/\|/, "")
  line = line.strip
  line = line.split(',')
  line.each do |x| x.gsub!(/\|/, "")
    x.strip!
  end
    @contribution_collection[line[1]] = line[2]
  # ap line

  }
  ap @contribution_collection
  your_file.close

end

# parse_committees
# parse_pac_contributions

def parse_pac_other16
  file = 'CampaignFin16/cmtes16.txt'
  your_file = File.open(file, encoding: 'windows-1252')
  your_file.each_line {|line|
  line = line.gsub(/\s\s+/, ' ')
  line = line.strip
  line = line.split(',')
  line.each do |x| x.gsub!(/\|/, "")
    x.strip!
   end
  ap line
}

end

def create_contributions
end

# parse_candidates

# parse_committees

parse_pac_other16