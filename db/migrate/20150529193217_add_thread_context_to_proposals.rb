class AddThreadContextToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :thread_context, :string
  end
end
