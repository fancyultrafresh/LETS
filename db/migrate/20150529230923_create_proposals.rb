class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string     :status#only accept [yes, no, open, canceled]
      t.string     :proposed_idea
      t.belongs_to :participation

      t.timestamps null: false
    end
  end
end
