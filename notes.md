1) Edit and delete functions and validations

2)creator functions! Management for their shows and contributions to those shows

4) Running Order? How to see the current version of a script?
    - Just dump them all on one show page with their current content?

5) Get rid of unused routes




<%= link_to 'Delete',url_for(action: :delete,id: @user.id),method: :delete, data: {confirm: "Are you sure?"} %>



<%= link_to vote_up_path(@votable, :votable_type => "Post"), :remote => true, :class => "vote-up default button" do %>
  <%= image_tag("like.png", :alt => "like", :class => "like") %>
  <span>Like</span>
<% end %>


<%=link_to "Delete",blog_path(@blog.id), :method => :delete, :class => "delete", :confirm => "Are you sure ?"%>  