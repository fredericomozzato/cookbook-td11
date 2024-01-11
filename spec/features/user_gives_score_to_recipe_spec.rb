require 'rails_helper'

feature 'Usuário visita uma receita' do
  context 'autenticado' do
    scenario 'e dá a primeira nota para uma receita' do
      user = create(:user)
      recipe = create(:recipe)

      login_as user
      visit recipe_path(recipe)
      select "5", from: "recipe_score"
      click_on "Avaliar"

      expect(page).to have_path(recipe_path(recipe))
      expect(page).to have_content "Média de avaliações: 5.0 (1)"
      expect(page).to has_no_select
      expect(page).not_to have_button "Avaliar"
    end
  end
end
