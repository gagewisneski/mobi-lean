class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.update_attributes(activated: true)
      session[:user_id] = user.id
      flash[:success] = 'Account activated!'
    else
      flash[:danger] = 'Invalid activation link'
    end
    redirect_to '/'
  end
end
