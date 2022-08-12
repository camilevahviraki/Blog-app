require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(Text: 'My test comment', author_id: 1, posts_id: 7) }

  before { subject.save }

  it 'Text should be present' do
    subject.Text = nil
    expect(subject).to_not be_valid
  end
  
  it 'Author Id should be integer' do
    subject.author_id = '1'
    expect(subject).to_not be_valid
  end

  it 'Author Id should be integer' do
    subject.posts_id = '7'
    expect(subject).to_not be_valid
  end
end