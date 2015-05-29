class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries, id: :uuid, default: 'uuid_generate_v4()' do |t|
      t.uuid :proposal_user_id, null: false, index: true
      t.string :status
      t.datetime :respond_by
      t.datetime :responded_at

      t.timestamps null: false
    end
    add_foreign_key :queries, :proposal_users
  end
end
