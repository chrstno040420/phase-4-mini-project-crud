class SpicesController < ApplicationController





def index
    spices = Spice.all 
    render json: spices
rescue ActiveRecord::RecordNotFound => error
    render json: { message: error.message}

end

def show
    
    spices = Spice.find(params[:id])
    render json:spices

rescue ActiveRecord::RecordNotFound => error
    render json: { message: error.message}
end

def create
    spices = Spice.create(new_params)
    render json: spices , status: :created
end

def update
    
    spices = Spice.find(params[:id])
    spices.update(new_params)
    render json:spices 

rescue ActiveRecord::RecordNotFound => error
    render json: { message: error.message}
end

def destroy

spices = Spice.find(params[:id])
spices.destroy
render json: {}

rescue ActiveRecord::RecordNotFound => error
    render json: { message: error.message}

end




private

def new_params
    params.permit(:title, :image, :description, :notes, :rating)
end





end