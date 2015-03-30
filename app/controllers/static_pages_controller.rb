class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def website
  end

  def companies
    respond_to do |format|
      format.html {  }
      format.js
    end
  end
end
