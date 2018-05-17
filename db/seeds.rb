explorer1 = Explorer.create(username: "Jon", email: "jon@jon.jon", password: "Jon")
hotspring1 = Hotspring.create(name: "Hippy Hollow", city: "Glenwood", state: "Colorado", directions: "I70, then left in Glenwood", description: "Fun")
comment1 = Comment.create(comment: "THis is a cool place")
hotspring1.explorer = explorer1
explorer1.hotsprings << hotspring1
comment1.explorer = explorer1
explorer1.comments << comment1
comment1.hotspring = hotspring1
hotspring1.comments << comment1