class Query < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :participation

  def user
    @_user ||= self.participation.user
  end
end
