class SessionsController < ApplicationController
    before_action :require_login, only: [:destroy]

    def create
        @user=User.find_by_email(params[:email])

        if @user

            if @user.try(:authenticate, params[:password])
                session[:user_id]=@user.id

                return redirect_to formations_path
            end
            flash[:errors]=["Invalid Password."]

        end

        flash[:errors]=['Invalid Email Account.']

        return redirect_to :back

    end

    def destroy
        @user = User.find(params[:id])
        session.clear

        return redirect_to root_path
    end
end
