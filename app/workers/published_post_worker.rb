class PublishedPostWorker
  include Sidekiq::Worker
  sidekiq_options

  def perform(post_id)
    post = Post.find(post_id)
    # UserMailer.post_published(post.user_email, post.title)
  end
end