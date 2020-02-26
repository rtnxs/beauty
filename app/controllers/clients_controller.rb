# frozen_string_literal: true

class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, only: %i[show edit update destroy]
  before_action :set_new_client, only: %i[index new]

  def index
    @q = Client.ransack(params[:q])
    @clients = @q.result
  end

  def show; end

  def new
    @client = Client.new
  end

  def edit; end

  def create
    @client = Client.new(client_params)
    authorize(@client)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
    end
  end

  private

  def set_client
    @client = Client.find(params[:id])
    authorize(@client)
  end

  def set_new_client
    @client = Client.new
    authorize(@client)
  end

  def client_params
    params.require(:client).permit(:name, :phone, :note)
  end
end
