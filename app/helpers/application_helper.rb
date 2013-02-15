module ApplicationHelper
  include TweetButton
  include FacebookShare

  def pull_facebook_data(user)
        user.events.create!(name: "", place: "", time: "")
        user.friends.create!(name: "", email: "", username: "")
        user.groups.create!(name: "", description: "", link: "")
        user.images.create!(link: "")
        user.informations.create!(about_you: "", address: "", birthday: "", contact_no: "", email: "", gender: "", history: "", relationship_status: "")
        user.likes.create!(category: "", link: "", name: "")
        user.mutual_friends.create!(email: "", name: "", username: "")
        user.works.create!(name: "", position: "")
  end
end
