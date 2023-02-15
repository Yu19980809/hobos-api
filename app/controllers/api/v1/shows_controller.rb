class Api::V1::ShowsController < Api::V1::BaseController
  before_action :set_show, only: %i[show update destroy]

  def index
    if params[:query]
      sql_query = <<~SQL
        shows.name ILIKE :query
        OR shows.description ILIKE :query
        OR shows.address ILIKE :query
        OR clubs.name ILIKE :query
      SQL

      @shows = Show.joins(:club).where(sql_query, query: "%#{params[:query]}%")
    else
      @shows = Show.includes(:club).all
    end
  end

  def show
    @club = @show.club
    @audiences = @show.users
    @comedians = []
    @show.show_comedians.each do |sc|
      @comedians.unshift(sc.user)
    end
  end

  def create
    show = Show.new(show_params)

    if show.save
      render json: 'success', status: 200
    else
      render json: show.errors, status: :unprocessable_entity
    end
  end

  def update
    if @show.update(show_params)
      render json: { message: 'success' }
    else
      render json: @show.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @show.destroy
      render json: { message: 'success' }
    else
      render json: @show.errors, status: :unprocessable_entity
    end
  end

  private

  def show_params
    params.require(:show).permit(:name, :description, :date, :start_time, :end_time, :address, :club_id, :poster)
  end

  def set_show
    @show = Show.find(params[:id])
  end
end
