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
