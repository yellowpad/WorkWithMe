class LikesController < ApplicationController
  def like
    like=Like.find_or_create_by(account_id: current_user.id, project_id: params[:project_id])

    if like.heart<=0
      like.heart+=1
    else
      like.heart-=1
    end

    if like.save
      flash[:error]="heart: " + like.heart.to_s
    else
      flash[:error]=like.errors.full_messages[0]
    end
    render plain: like.heart, status: 201
    
  end

  def dislike
    like=Like.find_or_create_by(account_id: current_user.id, project_id: params[:project_id])

    if like.heart>=0
      like.heart-=1
    else
      like.heart+=1
    end

    if like.save
      flash[:error]="heart: " + like.heart.to_s
    else
      flash[:error]=like.errors.full_messages[0]
    end
    redirect_to like.project
  end

end
