class ChangeIngredientsColumnName < ActiveRecord::Migration[5.2]
  def change
     change_table :ingredients do |t|
       t.rename :ingredients, :calories
     end
  end
end
