class MonsterTemplatesController < ApplicationController
  def index
    respond_to do |f|
      f.js { render layout: false }
    end
  end
end

