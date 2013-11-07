class Comment < ActiveRecord::Base
  attr_accessible :commentable_id, :commentable_type, :content, :integer, :title

  belongs_to :commentable, polymorphic: true

  validates :content, presence: true
end

# <% @posts.reverse.each do |post| %>
#   <% if post.class == TextPost %>
#     <p><strong><%= post.title %></strong></p>
#     <p><%= post.content %></p>
#   <% else %>
#     <p><strong><%= post.title %></strong><p>
#     <p><img src="<%= post.url %>"></p>
#   <% end %>
# <% end %>
