class TeamsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    # @team = policy_scope(Team).order(created_at: :asc)
    @team = Team.all
    # authorize @team
  end
end
