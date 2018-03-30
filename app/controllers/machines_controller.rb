class MachinesController < ApplicationController
  protect_from_forgery :except => [:update]

  def index
    @machines = Machine.all
  end

  def update
    code = params[:code]
    puts code

    @m = Machine.find_by_code(code)
    @m = Machine.create(code: code) unless @m
    @m.touch

    render plain: 'OK'
  end

end
