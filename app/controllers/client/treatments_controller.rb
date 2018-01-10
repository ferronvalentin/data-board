class Client::TreatmentsController < ApplicationController
  before_action :set_treatment, only: [:show, :edit, :update, :destroy]

   def index
     @treatments = current_user.treatments
  end

   def show
   end

   def new
     @treatment = Treatment.new
     # @town = current_user.town || Town.new
   end

   def create
     @treatment = Treatment.new(treatment_params)
     @treatment.user = current_user

     if @treatment.save
       redirect_to client_treatments_path(@treatment)
     else
       render :new
     end
   end

   def edit
   end

   def update
     @treatment.update(treatment_params)
     if @treatment.save
       redirect_to client_treatments_path(@treatment)
     else
       render :edit
     end
   end

   def destroy
     @treatment.destroy
     redirect_to client_treatments_path
   end

   private

   def set_treatment
     @treatment = Treatment.find(params[:id])
   end

   def treatment_params
     params.require(:treatment).permit(:user_id, :name, :start_date, :main_purpose, :other_purpose, :service_concerned, :service_function, :category_people_concerned, :personal_data, :sensitive_data, :recipient, :storage_time, :observation)
   end
 end
