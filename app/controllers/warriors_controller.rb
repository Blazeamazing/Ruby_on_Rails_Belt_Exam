class WarriorsController < ApplicationController
    before_action :require_login

   def create
      @formation = Formation.find(params[:id])

      Warrior.create(user: current_user, formation: @formation) unless @formation.users.include?(current_user)

      return redirect_to :back

   end

   def destroy

      @formation = Formation.find(params[:id])

      Warrior.find_by(formation: @formation, user: current_user).delete

      return redirect_to :back
   end
end
