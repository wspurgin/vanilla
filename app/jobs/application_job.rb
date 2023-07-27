class ApplicationJob < ActiveJob::Base
  self.queue_adapter = :sidekiq
  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError
  queue_as :default

  sidekiq_options retry: false

  def perform
  end
end
