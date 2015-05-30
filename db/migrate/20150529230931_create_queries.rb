class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.belongs_to :proposal
      t.uuid       :participation_id
      t.string     :status #accepts only [yes, no, meh] 'meh' not MVP
      t.datetime   :respond_by
      t.datetime   :responded_at

      t.timestamps null: false
    end
    add_foreign_key :queries, :participations
  end
end
