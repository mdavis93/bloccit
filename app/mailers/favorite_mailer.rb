class FavoriteMailer < ApplicationMailer
  default from: 'mdavis93@gmail.com'

  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@vast-beach-40576.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@vast-beach-40576.example>"
    headers["References"] = "<post/#{post.id}@vast-beach-40576.example>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end

  def new_post(post)
    headers["Message-ID"] = "<post/#{post.id}@vast-beach-40576.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@vast-beach-40576.example>"
    headers["References"] = "<post/#{post.id}@vast-beach-40576.example>"

    @post = post

    mail(to: post.user.email, subject: "Following your post, #{post.title}")
  end
end
