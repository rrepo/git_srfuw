class SorfuwController < ApplicationController
    
    before_action :move_to_index, except:[:index, :show]
    
    def index
        @sorfuw = Keiziban.includes(:user).order("created_at DESC").where.not(zatudanka_Q: "0").page(params[:page]).per(20)
        # @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
    end
    
    def situmon
        @sorfuw = Keiziban.order("created_at DESC").where.not(zatudanka_Q: "1").page(params[:page]).per(20)
    end
    
    def new
    end

    def create
    Keiziban.create(name: sorfuw_params[:name], image: sorfuw_params[:image], text: sorfuw_params[:text], user_id: current_user.id)
    @sorfuw = Keiziban.order("created_at DESC").where.not(zatudanka_Q: "0").page(params[:page]).per(20)
    end
    
    def destroy
    sorfuw = Keiziban.find(params[:id])
    # binding.pry
    sorfuw.destroy if sorfuw.user_id == current_user.id
    end
    
    def edit
    @sorfuw = Keiziban.find(params[:id])
    end
    
    def update
    @sorfuw = Keiziban.find(params[:id])
    if @sorfuw.user_id == current_user.id
     @sorfuw.update(sorfuw_params)
    end
    end
  
    def show
    @sorfuw = Keiziban.find(params[:id])
    @comments = @sorfuw.comments.includes(:user)
    end
  
    private
    def sorfuw_params
    params.permit(:name, :image, :text,:zatudanka_Q)
    end
    
    def move_to_index
    redirect_to action: :index unless user_signed_in?
    #ログイン画面にリダイレクトされるようにしたい
    end
    
end
