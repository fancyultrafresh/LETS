class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|#, id: :uuid, default: 'uuid_generate_v4()'
      t.belongs_to :user
      t.belongs_to :decision

      t.timestamps null: false
    end
  end
end
