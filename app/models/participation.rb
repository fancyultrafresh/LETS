class Participation < ActiveRecord::Base
  belongs_to :user
  belongs_to :decision
  has_many   :proposals
  has_many   :queries
end

# Decision.find("1").proposals

# # local, correct
# SELECT "proposals".*
# FROM "proposals"
# INNER JOIN "participations" ON "proposals"."participation_id" = "participations"."id"
# WHERE "participations"."decision_id" = 1;

# # wrong, remote
# SELECT "proposals".*
# FROM "proposals"
# INNER JOIN "participations" ON "proposals"."id" = "participations"."proposal_id"
# WHERE "participations"."decision_id" = 1;

# wrong, local
# SELECT "proposals".*
# FROM "proposals"
# INNER JOIN "participations" ON "proposals"."id" = "participations"."proposal_id"
# WHERE "participations"."decision_id" = 1

###### WARNING:
# remote:        Include 'rails_12factor' gem to enable all platform features
# remote:        See https://devcenter.heroku.com/articles/rails-integration-gems for more information.
# remote:
# remote: ###### WARNING:
# remote:        You have not declared a Ruby version in your Gemfile.
# remote:        To set your Ruby version add this line to your Gemfile:
# remote:        ruby '2.0.0'
# remote:        # See https://devcenter.heroku.com/articles/ruby-versions for more information.
# remote:
# remote: ###### WARNING:
# remote:        No Procfile detected, using the default web server (webrick)
# remote:        https://devcenter.heroku.com/articles/ruby-default-web-server
