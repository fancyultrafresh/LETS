class Api::DecisionsController < ApplicationController
  # respond_to :json

  def index
    render json: Decision.all
  end

  def show
    decision = Decision.find(params[:id])
    render json: decision.as_json(include: :participations)#.as_json(include: :proposals)
    # render :json => decision.to_json(:include => {:participations => {:include => :proposals}, :seasons => {}, :habitats => {}, :image_holders => {}})
  end

  def default_serializer_options
    { root: false }
  end

end
# format.json  {
#     render :json => @birds.to_json(:include => {:bird_colorations => {:include => :color}, :seasons => {}, :habitats => {}, :image_holders => {}}) }

# render :json => @booking, :include => [:paypal,
#                                        :boat_people,
#                                        :boat => {:only => :name, :include => {:port => {:only => :name, :include => {:city => {:only => :name, :include => {:country => {:only => :name}}}}},
#                                                 :boat_model => {:only => :name, :include => {:boat_type => {:only => :name}}}}}]
