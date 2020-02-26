# frozen_string_literal: true

class ServicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_service, only: %i[show edit update destroy]
  before_action :set_new_service, only: %i[index new]

  def index
    @services = Service.all
  end

  def show; end

  def new
    @service = Service.new
  end

  def edit; end

  def create
    @service = Service.new(service_params)
    authorize(@service)

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
    end
  end

  private

  def set_service
    @service = Service.find(params[:id])
    authorize(@service)
  end

  def set_new_service
    @service = Service.new
    authorize(@service)
  end

  def service_params
    params.require(:service).permit(:name, :price)
  end
end
