class StoriesController < ApplicationController

  hobo_model_controller

  auto_actions :write_only, :edit
  
  def update
    hobo_update do |wants|
      wants.html { redirect_to @story.bucket if valid? }
      wants.js {}
    end
  end
  
end
