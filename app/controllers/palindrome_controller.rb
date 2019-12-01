class PalindromeController < ApplicationController
  before_action :authorize

  def input
    begin
      a = params[:value].to_i
    rescue
      a = 0 if a < 0
    end
    begin
    respond_to do |format|
      format.html
      format.json do
        render json: { solution: Answer.where(query: a).first_or_create.get_solution.each { |x| x[0] = x[0].to_s } }
      end
    end
    end
    end
end
