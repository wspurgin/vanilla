require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'should not have any autoload deprecations' do
    Post.create(name: 'foo', title: 'bar')

    expect(Post.count).to eq(1)
  end
end
