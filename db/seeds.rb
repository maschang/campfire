user1 = User.create! email: 'sample1@uridoki.net', password: 'sample1'
user2 = User.create! email: 'sample2@uridoki.net', password: 'sample2'
user3 = User.create! email: 'sample3@uridoki.net', password: 'sample3'

room1 = Room.create! name: 'chat room1'
room1.users << user1
room1.users << user2

room1.messages.create! content: 'これはサンプルテキストです', user: user1
room1.messages.create! content: 'これはサンプルテキストです', user: user2
