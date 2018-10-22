class UsersController < ApplicationController
    def show
    user = User.find(params[:id])
    @nickname = current_user.nickname
    # @srfuw = Keiziban.where(user_id: current_user.id).(params[:page]).per(5).order("created_at DESC")
    @srfuw = user.keizibans.page(params[:page]).per(5).order("created_at DESC")
    has_many :comments
    end
end
