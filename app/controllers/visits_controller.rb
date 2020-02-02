# frozen_string_literal: true

class VisitsController < ApplicationController
  before_action :set_visit, only: %i[show edit update destroy]
  protect_from_forgery except: :create

  # GET /visits
  # GET /visits.json
  def index
    @visits = Visit.all
  end

  # GET /visits/1
  # GET /visits/1.json
  def show; end

  # GET /visits/new
  def new
    @visit = Visit.new
    @client = Client.new
  end

  # GET /visits/1/edit
  def edit; end

  # POST /visits
  # POST /visits.json
  def create
    @visit = Visit.new(visit_params)
    @client = Client.find_or_create_by(client_params)
    @visit.client = @client

    respond_to do |format|
      if @visit.save
        @visit.update!(visit_price: @visit.services.pluck(:price).sum)
        format.html { redirect_to @visit, notice: 'Visit was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /visits/1
  # PATCH/PUT /visits/1.json
  def update
    respond_to do |format|
      if @visit.update(visit_params)
        format.html { redirect_to @visit, notice: 'Visit was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /visits/1
  # DELETE /visits/1.json
  def destroy
    @visit.destroy
    respond_to do |format|
      format.html { redirect_to visits_url, notice: 'Visit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_visit
    @visit = Visit.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def visit_params
    params.require(:visit).permit(:client_id, :datetime, :visit_price, :note, service_ids: [])
  end

  def client_params
    params.require(:client).permit(:name, :phone)
  end
end
