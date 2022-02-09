User.create!(name: 'A', email: 'test1@email.com', password: 'aaaaaa', password_confirmation: 'aaaaaa')
User.create!(name: 'B', email: 'test2@email.com', password: 'bbbbbb', password_confirmation: 'bbbbbb')
User.create!(name: 'C', email: 'test3@email.com', password: 'cccccc', password_confirmation: 'cccccc')
User.create!(name: 'D', email: 'test4@email.com', password: 'dddddd', password_confirmation: 'dddddd')

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.memos.create!(content: content) }
end
