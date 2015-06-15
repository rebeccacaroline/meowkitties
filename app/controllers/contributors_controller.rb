class ContributorsController < ApplicationController
  Dotenv.load

  def index
   #  candidate = OpenSecrets::Candidate.new(ENV['OPENSECRET'])
   # # render json: candidate.summary({:cid => 'N00007360'})["response"].to_json
   # render json: candidate.summary({:cid =>'' })["response"].to_json

   # member = OpenSecrets::Member.new(ENV['OPENSECRET'])
   # render json: member.getLegislators

    # render json: member.to_json
  end

end
