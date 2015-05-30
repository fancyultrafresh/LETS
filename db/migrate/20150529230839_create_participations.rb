class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations, id: :uuid, default: 'uuid_generate_v4()' do |t|
      t.belongs_to :user
      t.belongs_to :decision

      t.timestamps null: false
    end
  end
end
