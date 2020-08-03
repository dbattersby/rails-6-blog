module PostsHelper

  def post_meta post
    "Created by #{ post.account.present? ? post.account.first_name : 'Admin' } #{ time_ago_in_words(post.created_at) } ago. Posted within #{ post.category.title } (#{ post.views } views)."
  end

end
