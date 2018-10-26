class UsersController < ApplicationController
    def show
    user = User.find(params[:id])
    @nickname = current_user.nickname
    @srfuw = user.keizibans.page(params[:page]).per(5).order("created_at DESC")
    # has_many :comments
    end
end
