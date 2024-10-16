class Api::V1::EarthquakesController < ApplicationController
  before_action :set_earthquake, only: [:show, :update, :destroy]
  before_action :doorkeeper_authorize!, except: [:index, :show]

  # GET /earthquakes
  def index
    cache_key = "earthquakes_page_#{params[:page] || 1}"
    @earthquakes = Rails.cache.fetch(cache_key, expires_in: 12.hours) do
      Earthquake.page(params[:page]).per(20).to_a
    end
    render json: @earthquakes
  end

  # GET /earthquakes/:id
  def show
    render json: @earthquake
  end

  # POST /earthquakes
  def create
    @earthquake = Earthquake.new(earthquake_params)
    if @earthquake.save
      render json: @earthquake, status: :created
    else
      render json: @earthquake.errors, status: :unprocessable_entity
    end
  end

  # PUT /earthquakes/:id
  def update
    if @earthquake.update(earthquake_params)
      render json: @earthquake
    else
      render json: @earthquake.errors, status: :unprocessable_entity
    end
  end

  # DELETE /earthquakes/:id
  def destroy
    if @earthquake.destroy
      render json: { message: "Earthquake Information Deleted Successfully" }, status: :ok
    else
      render json: { error: "Failed to delete earthquake information" }, status: :unprocessable_entity
    end
  end

  private

  def set_earthquake
    @earthquake = Earthquake.find(params[:id])
  end

  def earthquake_params
    params.require(:earthquake).permit(:location, :magnitude, :depth, :occurred_at)
  end
end