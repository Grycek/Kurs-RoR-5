class RadioProgramsController < ApplicationController
    before_filter :authenticate_user!#, :except => [:index]
    attr_reader :per_page
    @@per_page = 3
    
    
    def index
        @search         = RadioProgram.search( params[:search] )
        @s              = params[:search]
        #@radio_programs = @search.all
        @radio_programs = @search.paginate(:page => params[:page], :per_page => 2)
        #@radio_programs = RadioProgram.all
        #@mth = RadioProgram.methods
    end
    
    def new
        @radio_program = RadioProgram.new
    end
    
    def create
      @radio_program = RadioProgram.new(params[:radio_program])
      @radio_program.update_attributes(:user_id => current_user.id)
      if @radio_program.save
          redirect_to radio_programs_path
      else
          render :action => :new
      end
    end
        
end
