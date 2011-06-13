class VcrController < ApplicationController
  def index
  end

  def insert
    cassette_name = File.join('development', params[:cassette][:name])
    cassette = VCR.insert_cassette(cassette_name)
    flash_message :notice, "Inserted cassette #{cassette.name}"
    redirect_to :action => 'index'
  end

  def eject
    cassette = VCR.eject_cassette
    flash_message :notice, "Ejected cassette #{cassette.name}"
    redirect_to :action => 'index'
  end

end
