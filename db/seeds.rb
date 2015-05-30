user1 = User.create(name:"Candice",email:"c@c.c",password_digest:"password")
user2 = User.create(name:"Shannon",email:"s@s.s",password_digest:"password")
user3 = User.create(name:"Natty",email:"n@n.n",password_digest:"password")
user4 = User.create(name:"Logan",email:"l@l.l",password_digest:"password")


user1.decisions.create(context:"have dinner tonight!")

d = Decision.first

user2.decisions << d
user3.decisions << d
user4.decisions << d

part1 = Participation.all[0]
part2 = Participation.all[1]

part1.proposals.create(proposed_idea:"DOMINOES")

prop1  = Proposal.first
query1 = prop1.queries.create(participation:part1,status:"yes")

query2 = prop1.queries.create(participation:part2,status:"yes")

