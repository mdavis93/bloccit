# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'random_data'

50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end

posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

Post.find_or_create_by!(title: "Idempotent Title") do |p|
  p.body = "This should only appear one time."
end

Comment.find_or_create_by!(post_id: Post.all.find_or_create_by!(title: "Idempotent Title").id) do |p|
  p.body = "This comment should be idempotent and not repeate."
end

puts "Seed Finished"
puts "#{Post.count} posts created."
puts "#{Comment.count} comments created."
