class BucketsController < ApplicationController

  hobo_model_controller

  auto_actions :write_only, :edit
  
  def show
    @bucket = find_instance
    @bucket_stories = @bucket.stories.apply_scopes(:owner_is => params[:owner])
  end

end
