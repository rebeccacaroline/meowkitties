class ContributorsController < ApplicationController


  def index
    @contribution = Contribution.all.limit(20)
    render json: @contribution.to_json
  end

  def new
    @contributor = Contributor.all
    render json: @contributor.to_json
  end

  def edit

  end

end
