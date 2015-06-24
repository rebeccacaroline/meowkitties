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
end

def parse_individuals
  return_value = []
  return_valuezz = Hash.new
  z = 'CampaignFin16/indivs16.txt'

  your_file = File.open(z, encoding: 'windows-1252')
  your_file.each_line do |line|
    line = line.gsub(/\s\s+/, ' ')
    line = line.gsub(/\,\,+/, ' ')
    line = line.gsub(/\|/, "")
    line = line.strip
    line = line.split(',')
    # line.each do |x|
    #   if x[0] == " "
    #       x[0] = ""
    #   end
    # end
    return_value << line
    # ap line
    # return_valuezz[:line] = line
    # ap return_valuezz
  end
  return_value
end


def create_indiv_contributors
  parsed = parse_individuals
  parsed.each do |contributor|
    Contributor.create({
      name: "#{contributor[3]} #{contributor[4]}",
      pac_id: contributor[2]
      })
  end
end

def create_indiv_contributions
  parsed = parse_individuals
  parsed.each do |contributor|
    Contribution.create({
      politician: Politician.where(cid: contributor[5]).first,
      amount: contributor[10],
      contributor: Contributor.where(pac_id: contributor[2]).first
      })
  end
end





# def parse_committees
#   # @contribution_collection = Hash.new(0)
#   file = 'CampaignFin16/cmtes16.txt'
#   your_file = File.open(file, encoding: 'windows-1252')
#   your_file.each_line {|line|
#   line = line.gsub(/\s\s+/, ' ')
#   # line = line.gsub(/\,\,+/, ' ')
#   # line = line.gsub(/\|/, "")
#   line = line.strip
#   line = line.split(',')
#   line.each do |x| x.gsub!(/\|/, "")
#     x.strip!
#   end
#     @contribution_collection[line[1]] = line[2]
#   # ap line


# def parse_pac_contributions
#   return_value = []
#   f = 'CampaignFin16/pacs16.txt'
#   my_file = File.open(f)
#   my_file.each_line do |line|
#    lines = line.split(",")
#    lines.each do |xyz|
#     if xyz[0] == "|" && xyz[-1] == "|"
#       xyz.slice!(0)
#       xyz.slice!(-1)
#     end
#   end
#   @pac = lines[2]
#   @candidate = lines[3]
#   @amount = lines[4].to_i
#   @name = @contribution_collection[@pac] if @contribution_collection[@pac]
#   return_value << [@candidate, @amount, @name, @pac]
#   end
#    p return_value

# end
def parse_pac_contributions
  return_value = []
  f = 'CampaignFin16/pacs16.txt'
  my_file = File.open(f)
  my_file.each_line do |line|
   lines = line.split(",")
   lines.each do |xyz|

    if xyz[0] == "|" && xyz[-1] == "|"
      xyz.slice!(0)
      xyz.slice!(-1)
    end
  end
  pac = lines[2]
  candidate = lines[3]
  amount = lines[4].to_i
  name = @contribution_collection[pac] if @contribution_collection[pac]
  return_value << [candidate, amount, name, pac]
  end
  return_value

end

# parse_pac_contributions



# def parse_individuals
#   return_value = []
#   z = 'CampaignFin16/indivs16.txt'

#   your_file = File.open(z, encoding: 'windows-1252')
#   your_file.each_line do |line|
#     line = line.gsub(/\s\s+/, ' ')
#     line = line.gsub(/\,\,+/, ' ')
#     line = line.gsub(/\|/, "")
#     line = line.strip
#     line = line.split(',')
#     line.each do |x|
#       if x[0] == " "
#           x[0] = ""
#       end
#     end
#     return_value << line
#   end
#   ap return_value
# end

# parse_individuals

def parse_committees
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

  }
  @contribution_collection

end



def create_pac_contributions
  parsed = parse_pac_contributions
  parsed.each do |contributor|
    Contribution.create({
      politician: Politician.where(cid: contributor[0]).first,
      amount: contributor[1],
      contributor: Contributor.where(pac_id: contributor[3]).first
      })
  end
end


#a
def create_pac_contributors
  parsed = parse_pac_contributions
  parsed.each do |x|
    Contributor.create({
      name: x[2],
      pac_id: x[3]
      })
    end
  # do |contributor|
  #   Contributor.create({
  #     name: @name,
  #     pac_id: @pac
  #     })
  # end
end

parse_candidates
parse_individuals
parse_committees
parse_pac_contributions
create_pac_contributors
create_pac_contributions
create_indiv_contributors
create_indiv_contributions

# def create_pac_contributors
#   parse_pac_contributions.each do |cont|
#     ap cont
#   end
# end

# create_pac_contributors
# parse_candidates
# create_indiv_contributors
# create_pac_contributions
# create_pac_contributors
