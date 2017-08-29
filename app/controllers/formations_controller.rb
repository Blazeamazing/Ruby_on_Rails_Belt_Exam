class FormationsController < ApplicationController
    before_action :require_login, only: [:show]

   def index
      @formations = Formation.all

   end

   def show
      @formation = Formation.find(params[:id])
   end

   def create

      @formation = Formation.new(formation_params)

      if @formation.save

         Warrior.create(user: current_user, formation:@formation )

         flash[:notice] = ["New Formation Created."]

         return redirect_to :back

      end

      flash[:errors] = @formation.errors.full_messages

      return redirect_to :back

   end

   def destroy
      @formation = Formation.find(params[:id])

      @formation.destroy

      return redirect_to :back
   end


   private
      def formation_params
         params.require(:formation).permit(:id,:name, :description).merge(user: current_user)
      end
end
