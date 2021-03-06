class CategoriesController < ApplicationController
	
  	before_action :authenticate_editor!, only: [:new, :create, :update, :edit, :destroy] 
  	before_action :set_category, only: [:show, :update, :edit, :destroy]
	
	def index
  		@categories = Category.all
  	end

  	def show
  	end

  	def new
  		@category = Category.new
  	end

  	def create 
  		@category = Category.new(category_params)
  		if @category.save
        	redirect_to categories_path, notice: "İnterpreter was saved"
      else
        	render :new, notice: "interpreter couldn't saved"
      end
	  end

	  def edit
    end
	
	  def update
	    if @category.update(category_params)
	      redirect_to category_path(@category)
	    else
	      render :edit
	    end
  	end

    def destroy
      @category.destroy
      redirect_to interpreters_path
    end

  	private

  	def set_category
  		@category = Category.find(params[:id])
  	end

  	def category_params
  		params.require(:category).permit(:title)
  	end


end
