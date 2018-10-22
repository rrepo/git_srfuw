class SrfuwController < ApplicationController
    
    before_action :move_to_index, except:[:index, :show]
    
    def index
        @srfuw = Keiziban.includes(:user).order("created_at DESC").where.not(zatudanka_Q: "0").page(params[:page]).per(20)
        # @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
    end
    
    def situmon
        @srfuw = Keiziban.order("created_at DESC").where.not(zatudanka_Q: "1").page(params[:page]).per(20)
    end
    
    def new
    end

    def create
    Keiziban.create(name: srfuw_params[:name], image: srfuw_params[:image], text: srfuw_params[:text], user_id: current_user.id)
    @srfuw = Keiziban.order("created_at DESC").where.not(zatudanka_Q: "0").page(params[:page]).per(20)
    end
    
    def destroy
    srfuw = Keiziban.find(params[:id])
    # binding.pry
    srfuw.destroy if srfuw.user_id == current_user.id
    end
    
    def edit
    @srfuw = Keiziban.find(params[:id])
    end
    
    def update
    @srfuw = Keiziban.find(params[:id])
    if @srfuw.user_id == current_user.id
     @srfuw.update(srfuw_params)
    end
    end
  
    def show
    @srfuw = Keiziban.find(params[:id])
    @comments = @srfuw.comments.includes(:user)
    end
  
    private
    def srfuw_params
    params.permit(:name, :image, :text,:zatudanka_Q)
    end
    
    def move_to_index
    redirect_to action: :index unless user_signed_in?
    #ログイン画面にリダイレクトされるようにしたい
    end
    
end
