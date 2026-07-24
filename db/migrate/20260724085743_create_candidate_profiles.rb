class CreateCandidateProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :candidate_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :city
      t.string :country
      t.timestamps
    end
  end
end
