class UpdateUserStatusJob
  include Sidekiq::Job

  def perform
    users = User.all
    users.each do |user|
      if (user.last_seen_at + 2.minutes) < Time.now
        user.update(status:  false)
      end
    end
  end
end
