# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.create([{title: 'Very First Post', body: 'This the first attempt to publish smth...'},{title: 'The Second', body: 'One more attempt... may be also not the best...'}])
Category.create([{title: 'About Kittens'},{title: 'About Puppies'},{title: 'About Small Funny Rabbits'},{title: 'About Huge Crocodiles'}])
Tag.create([{name: 'small&funny'},{name: 'wild nature'},{name: 'pets'}])
PostsTag.create([{post_id: '1', tag_id: '2'},{post_id: '1', tag_id: '3'}])
Comment.create([{body: 'Ffffuuuhhh...'},{body: 'Oh! no! that is also ffuuuuhhh...' }])
CategoriesPost.create([{category_id: '2', post_id: '1'},{category_id: '1', post_id: '2'}])
User.create([{login: 'hvs-fasya', password: '1234'},{login: 'aaaa', password: 'aaaa'}])
Profile.create([{firstname: 'Elena', lastname: 'Tolkacheva', email: 'hvs-fasya@mail.ru', user_id: '1'}])
Post.find(1).update(user_id: '1')
Post.find(2).update(user_id: '1')
Comment.find(1).update(post_id: '1')
Comment.find(2).update(post_id: '1')