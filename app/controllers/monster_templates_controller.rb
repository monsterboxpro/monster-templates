class MonsterTemplatesController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :login_required
  def index
    respond_to do |f|
      f.js { render layout: false }
    end
  end
end

