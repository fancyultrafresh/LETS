class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.belongs_to :proposal
      t.belongs_to :participation
      t.string     :status #accepts only [yes, no, meh, i'm out] are these correct?
      t.datetime   :respond_by
      t.datetime   :responded_at

      t.timestamps null: false
    end
  end
end
