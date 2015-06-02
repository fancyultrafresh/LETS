class Query < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :participation

  after_save: instantiate_query_timing_process

  def user
    @_user ||= self.participation.user
  end

  # has_one    :user, through: :participation # replaced by Query#user

  validates_presence_of :participation_id, :status#, :respond_by, :responded_at
  # validates_inclusion_of :status, :in => %w(yes no)


  def instantiate_query_timing_process

   new_participation_id =  self.propsal.next_voter

    if
    end

  end
end
