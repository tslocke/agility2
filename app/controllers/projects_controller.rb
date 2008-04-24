class ProjectsController < ApplicationController

  hobo_model_controller

  auto_actions :write_only, :index, :show, :edit, :new, :new_bucket

end
