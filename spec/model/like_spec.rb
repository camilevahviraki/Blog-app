require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new(author_id: 1, posts_id: 2) }

  before { subject.save }
  
  it 'Author Id should be integer' do
    subject.author_id = '1'
    expect(subject).to_not be_valid
  end

  it 'Author Id should be integer' do
    subject.posts_id = '7'
    expect(subject).to_not be_valid
  end

  after { subject.save }

  it 'has 1 liked at after #create' do
   expect(Like.count).to eq(0)
 end

end