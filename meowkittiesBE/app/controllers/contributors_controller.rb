class ContributorsController < ApplicationController


  def index
    # @contributor = Contributor.all
    @contribution = Contribution.all
    # @politician = Politician.all

    render json: @contribution.to_json
  end

  def new
    @contributor = Contributor.all
    render json: @contributor.to_json
  end

  def edit

  end

end
