class PostsController < ApplicationController
  def create
    if params[:edit_id].present?
      AuditTriggerRails.app_data = { edit_id: params[:edit_id] }
    end
    Post.create title: params[:title], content: params[:content]
    head :ok
  end
end
