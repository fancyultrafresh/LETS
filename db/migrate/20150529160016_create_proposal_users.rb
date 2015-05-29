class CreateProposalUsers < ActiveRecord::Migration
  def change
    create_table :proposal_users, id: :uuid, default: 'uuid_generate_v4()' do |t|
      t.uuid :proposal_id, null: false, index: true
      t.uuid :user_id, null: false, index: true
    end
    add_foreign_key :proposal_users, :proposals
    add_foreign_key :proposal_users, :users
  end
end
