# class TreatmentsController < ApplicationController
#   # before_action :set_project, only: :show
#
#   def index
#     @treatments = current_user.treatments.all
#   end
#
#   def show
#     @treatment = Treatment.find(params[:id])
#   end
#
#   def new
#     @treatment = Treatment.new
#     @town = current_user.town || Town.new
#     # render layout: false
#   end
#
#   def create
#     @town = current_user.town|| current_user.build_town(town_params)
#     @treatment = @town.treatments.new(treatment_params)
#
#     if @town.save && @town.save
#       redirect_to town_treatments_path, notice: "Votre traitement a bien été créé"
#     else
#       render :new
#     end
#   end
#
#   private
#
#   def town_params
#     params.require(:treatment).require(:town).permit(:city, :address, :mayor_name)
#   end
#
#   def treatment_params
#     params.require(:treatment).permit(:request_title, :request_description, :budget, :request_delivery_at)
#   end
# end
