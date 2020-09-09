class ProjectController < ApplicationController
  def index
    @res = {message: "ok"}.to_json
  end
end
