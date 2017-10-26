class UnitsController < ApplicationController

  before_action :set_unit, only: [:show, :edit, :update, :destroy]
  require 'json'
  include HTTParty


  TOKEN = ''
  AUTH = 'Bearer ' + TOKEN
  HOST = "api-stage.casa.iq"

  # GET /units
  # GET /units.json
  def index
    response = HTTParty.get("https://casa-core.herokuapp.com/api/units", :headers => { "Authorization" => AUTH, "Host" => HOST})
    @units =  JSON.parse(response.body)
    return @units
  end

  # GET /units/1
  # GET /units/1.json
  def show
    query = {
      'id' => unit_params[:id]
    }
    response = HTTParty.get("https://casa-core.herokuapp.com/api/units/?id", :query => query, :headers => { "Authorization" => AUTH, "Host" => HOST})

    if response.code == 200
      @unit = JSON.parse(response.body)
    else
      redirect_to unit_path(params[:id]), notice: 'Hmm...thats strange...try that again.'
    end
  end

  # GET /units/new
  def new
    @unit = Unit.new
  end

  # GET /units/1/edit
  def edit
    query = {
      'id' => unit_params[:id]
    }
    response = HTTParty.get("https://casa-core.herokuapp.com/api/units/?id", :query => query, :headers => { "Authorization" => AUTH, "Host" => HOST})

    if response.code == 200
      @unit = JSON.parse(response.body)
    else
      redirect_to unit_path(params[:id]), notice: 'Uh oh...something went wrong.  Please try again.'
    end
  end

  # POST /units
  # POST /units.json
  def create
    # I was not able to get this working.  I suspected a change may have occurred in the API that hasn't been published to docs.
    # Used https://www.hurl.it/ to test requests to the API.  Was getting a success response, but
    # never saw the newly created unit in either my SDK or in the stage environment.  Could be in the DB but missing an attribute/flag that allows
    # association to the property and/or allows for display.
    puts 'test1'
    #@unit = Unit.new(params)
    puts 'XYZ'
    puts params[:name]
    puts 'ABC'
  end

  # PATCH/PUT /units/1
  # PATCH/PUT /units/1.json
  def update
    url = 'https://casa-core.herokuapp.com/api/units/' + params[:id]
    query = {
      'name' => params[:name]
    }
    response = HTTParty.put(url, :query => query, :headers => { "Authorization" => AUTH, "Host" => HOST})

    if response.code == 200
      redirect_to unit_path(params[:id]), notice: 'Unit was successfully updated.'
    else
      redirect_to unit_path(params[:id]), notice: 'Sheesh!  Minor hiccup...run that again!'
    end
  end

  # DELETE /units/1
  # DELETE /units/1.json
  def destroy
    url = 'https://casa-core.herokuapp.com/api/units/' + params[:id]
    response = HTTParty.delete(url, :headers => { "Authorization" => AUTH, "Host" => HOST})
    redirect_to units_url, notice: 'Unit was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      #@unit = Unit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_params
      #params.require(:unit).permit(:name, :email, :cname)
      params.permit(:id, :name, :email, :cname)
    end
end
