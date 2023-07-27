require "rails_helper"

RSpec.describe ApplicationJob, type: :job do
  it "works with sidekiq_options" do
    ApplicationJob.perform_later
    expect(Sidekiq::Job).to have_enqueued_sidekiq_job
    expect(ApplicationJob).to be_processed_in(:default)
  end
end
