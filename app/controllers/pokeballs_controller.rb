class PokeballsController < ApplicationController

  def create
    # Retrouver le Pokemon via son id
    @pokemon = Pokemon.find(params[:pokemon_id])
    # Instancier une Pokeball avec les informations du formulaire
    @pokeball = Pokeball.new(pokeball_params)
    # Associer la Pokeball avec le Pokemon
    @pokeball.pokemon = @pokemon
    # Si la pokeball est save
    if @pokeball.save
      # On redirige vers le profil du trainer
      redirect_to trainer_path(@pokeball.trainer)
    # Sinon
    else
      render 'pokemons/show', status: :unprocessable_entity
    end
  end

  private

  def pokeball_params
    params.require(:pokeball).permit(:trainer_id, :location, :caught_on)
  end
end
