class RecipesController < ApplicationController
	before_action :find_recipe, only: [:show, :destroy ,:edit ,:update]

	def index
		@recipe = Recipe.all.order("created_at DESC")
	end

	def show
	end

	def new 
		@recipe = current_user.recipes.build
	end

	def create 
		@recipe = current_user.recipes.build(recipe_params)
		if @recipe.save
			redirect_to @recipe, notice: 'Successfully created'
		else 
			render 'new'
		end
	end

	def edit
	end

	def update
		if @recipe.update(recipe_params)
			redirect_to @recipe, notice: 'Successfully updated'
		else 
			render 'new'
		end
	end

	def destroy
		if @recipe.destroy
			redirect_to root_path
		end
	end

	private
		def find_recipe
			@recipe = Recipe.find(params[:id])
		end

		def recipe_params
			params.require(:recipe).permit(:image,:title,:description)
		end
end
