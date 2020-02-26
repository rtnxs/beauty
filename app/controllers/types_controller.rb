# frozen_string_literal: true

class TypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_type, only: %i[show edit update destroy]
  before_action :set_new_type, only: %i[index new]

  def index
    @types = Type.all
  end

  def show; end

  def new
    @type = Type.new
  end

  def edit; end

  def create
    @type = Type.new(type_params)
    authorize(@type)

    respond_to do |format|
      if @type.save
        format.html { redirect_to @type, notice: 'Type was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @type.update(type_params)
        format.html { redirect_to @type, notice: 'Type was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @type.destroy
    respond_to do |format|
      format.html { redirect_to types_url, notice: 'Type was successfully destroyed.' }
    end
  end

  private

  def set_type
    @type = Type.find(params[:id])
    authorize(@type)
  end

  def set_new_type
    @type = Type.new
    authorize(@type)
  end

  def type_params
    params.require(:type).permit(:name)
  end
end
