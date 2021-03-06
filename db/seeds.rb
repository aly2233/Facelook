# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)\

require 'open-uri'

User.destroy_all
Post.destroy_all
Comment.destroy_all
Like.destroy_all

demoUser = User.create!(email: 'demo@demo.com', password: 'demodemo', first_name: 'Demo', last_name: 'Demo', birthday: '1999-01-01', bio: "I am a demo", hometown: "Demo, Demo", current_town: "Demo, Demo", relationship: "Single", school: "Demo University")
demoUser.cover_picture.attach(io: File.open("app/assets/images/default_cover_picture.png"), filename: "default_cover_picture.png")
demoUser.profile_picture.attach(io: File.open("app/assets/images/default-profile-pic-m.jpg"), filename: "default-profile-pic-m.jpg")

user1 = User.create!(email: 'ayueh5555@gmail.com', password: 'alanyueh', first_name: 'Alan', last_name: 'Yueh', birthday: '1995-04-06', bio: "Hello World", hometown: "Fort Lee, NJ", current_town: "Fort Lee", relationship: "In a Relationship", school: "Rutgers University")
user1.cover_picture.attach(io: File.open("app/assets/images/dog-cover-pic.jpg"), filename: "dog-cover-pic.jpg")
user1.profile_picture.attach(io: File.open("app/assets/images/alan-profile-pic.jpg"), filename: "alan-profile-pic.jpg")

user2 = User.create!(email: 'hello@hello.com', password: 'hello hello', first_name: 'Hello', last_name: 'Hello', birthday: '1999-01-01', bio: "Just saying hi!", hometown: "Hola, Bonjour", current_town: "Hola, Bonjour", relationship: "It's Complicated", school: "Greetings University")
user2.cover_picture.attach(io: File.open("app/assets/images/default_cover_picture.png"), filename: "default_cover_picture.png")
user2.profile_picture.attach(io: File.open("app/assets/images/default-profile-pic-m.jpg"), filename: "default-profile-pic-m.jpg")

user3 = User.create!(email: 'mango@gmail.com', password: 'barkwoof', first_name: 'Mango', last_name: 'Yueh', birthday: '2021-02-14', bio: "Woof Woof", hometown: "Somewhere, Kentucky", current_town: "New York, New York", relationship: "Woof", school: "Bark University")
user3.cover_picture.attach(io: File.open("app/assets/images/mango_cover.jpg"), filename: "mango_cover.jpg")
user3.profile_picture.attach(io: File.open("app/assets/images/mango_profile.jpg"), filename: "mango_profile.jpg")

user4 = User.create!(email: 'boba@gmail.com', password: 'barkwoof', first_name: 'Boba', last_name: 'Yueh', birthday: '2021-01-16', bio: "Woof Woof", hometown: "Somewhere, Kentucky", current_town: "New York, New York", relationship: "Woof", school: "Bark University")
user4.cover_picture.attach(io: File.open("app/assets/images/boba-cover-pic.jpg"), filename: "boba-profile-pic.jpg")
user4.profile_picture.attach(io: File.open("app/assets/images/boba-profile-pic.jpg"), filename: "boba-profile-pic.jpg")


post1 = Post.create!(
    body: "I just had the BIGGEST pizza and ate it all!",
    author_id: demoUser.id,
    profile_id: demoUser.id
)

post2 = Post.create!(
    body: "Hi Alan! I hope you're doing well.",
    author_id: demoUser.id,
    profile_id: user1.id
)

post3 = Post.create!(
    body: "Bark bark woof woof",
    author_id: user3.id,
    profile_id: user4.id
)

post4 = Post.create!(
    body: "Time for dinner!",
    author_id: user1.id,
    profile_id: user3.id
)

post5 = Post.create!(
    body: "Let's go on a walk",
    author_id: user1.id,
    profile_id: user4.id
)

post6 = Post.create!(
    body: "Want to hang out this friday?",
    author_id: user1.id,
    profile_id: user2.id
)

friend1 = Friend.create!(
    user_id: demoUser.id,
    friend_id: user1.id
)

friend1_back = Friend.create!(
    user_id: user1.id,
    friend_id: demoUser.id
)

friend2 = Friend.create!(
    user_id: demoUser.id,
    friend_id: user2.id
)

friend2_back = Friend.create!(
    user_id: user2.id,
    friend_id: demoUser.id
)

friend3 = Friend.create!(
    user_id: demoUser.id,
    friend_id: user3.id
)

friend3_back = Friend.create!(
    user_id: user3.id,
    friend_id: demoUser.id
)

friend4 = Friend.create!(
    user_id: demoUser.id,
    friend_id: user4.id
)

friend4_back = Friend.create!(
    user_id: user4.id,
    friend_id: demoUser.id
)

friend5 = Friend.create!(
    user_id: user4.id,
    friend_id: user1.id
)

friend5_back = Friend.create!(
    user_id: user1.id,
    friend_id: user4.id
)

friend6 = Friend.create!(
    user_id: user4.id,
    friend_id: user3.id
)

friend6_back = Friend.create!(
    user_id: user3.id,
    friend_id: user4.id
)

friend7 = Friend.create!(
    user_id: user1.id,
    friend_id: user3.id
)

friend7_back = Friend.create!(
    user_id: user3.id,
    friend_id: user1.id
)

friend8 = Friend.create!(
    user_id: user1.id,
    friend_id: user2.id
)

friend8_back = Friend.create!(
    user_id: user2.id,
    friend_id: user1.id
)

comment1 = Comment.create!(
    commenter_id: user2.id,
    body: "Sure! Do you have anything in mind?",
    post_id: post6.id
)

comment2 = Comment.create!(
    commenter_id: user4.id,
    body: "*Spins in circles excitedly*",
    post_id: post5.id
)

comment3 = Comment.create!(
    commenter_id: user3.id,
    body: "Bark bark yip yip",
    post_id: post4.id
)

comment4 = Comment.create!(
    commenter_id: user1.id,
    body: "Let's go watch a movie",
    post_id: post6.id
)

comment5 = Comment.create!(
    commenter_id: user1.id,
    body: "I'm doing great! How has your family been?",
    post_id: post2.id
)

comment6 = Comment.create!(
    commenter_id: demoUser.id,
    body: "Everyone is safe and healthy! Let's catch up some time",
    post_id: post2.id
)

comment7 = Comment.create!(
    commenter_id: user1.id,
    body: "Please share, I'm so hungry right now",
    post_id: post1.id
)

like1 = Like.create!(
    liker_id: user2.id,
    likeable_type: 'Comment',
    likeable_id: comment4.id,
)

like2 = Like.create!(
    liker_id: user4.id,
    likeable_type: 'Post',
    likeable_id: post5.id,
)

like3 = Like.create!(
    liker_id: user3.id,
    likeable_type: 'Post',
    likeable_id: post4.id,
)

like4 = Like.create!(
    liker_id: user1.id,
    likeable_type: 'Comment',
    likeable_id: comment6.id,
)

like5 = Like.create!(
    liker_id: user1.id,
    likeable_type: 'Post',
    likeable_id: post1.id,
)
