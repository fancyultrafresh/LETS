class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: :uuid, default: 'uuid_generate_v4()' do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end


require 'securerandom'
class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals, id: :uuid, default: 'uuid_generate_v4()' do |t|
      t.text :content
      t.string :status
      t.uuid :thread_id, null: false, index: true, default: SecureRandom.uuid
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end


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
