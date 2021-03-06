# frozen_string_literal: true

class VisitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_visit, only: %i[show edit update destroy]
  before_action :set_new_visit, only: %i[index new]
  protect_from_forgery except: :create

  def index
    @q = Visit.ransack(params[:q])
    @visits = @q.result.order('datetime DESC').includes(:client)
  end

  def show; end

  def new
    @client = @visit.build_client
  end

  def edit; end

  def create
    @visit = Visit.new(visit_params)
    authorize(@visit)
    @client = Client.find_or_create_by(visit_params[:client_attributes])

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

  def update
    respond_to do |format|
      if @visit.update(visit_params)
        format.html { redirect_to @visit, notice: 'Visit was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @visit.destroy
    respond_to do |format|
      format.html { redirect_to visits_url, notice: 'Visit was successfully destroyed.' }
    end
  end

  private

  def set_visit
    @visit = Visit.find(params[:id])
    authorize(@visit)
  end

  def set_new_visit
    @visit = Visit.new
    authorize(@visit)
  end

  def visit_params
    params.require(:visit).permit(
      :client_id,
      :datetime,
      :visit_price,
      :note,
      service_ids:       [],
      client_attributes: %i[id name phone]
    )
  end
end
