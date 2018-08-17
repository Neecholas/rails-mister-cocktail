class DosesController < ApplicationController
  def new
    @doses = Dose.all
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = array_ingredients
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  def array_ingredients
    array = []
    Ingredient.all.each do |ingredient|
      array << [ingredient.name, ingredient.id]
    end
    return array
  end

  private
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
