# encoding: utf-8
class AdminController < ApplicationController
  def index
    @attend_count = Attend.count
  end
end
