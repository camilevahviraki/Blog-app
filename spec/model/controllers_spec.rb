require 'rails_helper'

RSpec.describe 'Controllers', type: :request do
  subject { User.new(Name: 'camilux', Photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQx5pB6py4twIFGBfFT4IS8E13iYj_pzGyKw&usqp=CAU', Bio: 'kefjwckllkl', PostsCounter: 0) }

  before :each do
    subject.save
    Post.create(Title: 'Test title1', Text: 'Test Text1', CommentsCounter: 1, LikesCounter: 0,
                author_id: User.find(subject.id).id)
    Post.create(Title: 'Test title2', Text: 'Test Text2', CommentsCounter: 0, LikesCounter: 0,
                author_id: User.find(subject.id).id)
    Post.create(Title: 'Test title3', Text: 'Test Text3', CommentsCounter: 0, LikesCounter: 0,
                author_id: User.find(subject.id).id)
    Comment.create(Text: 'Comment number1 test', posts_id: Post.find_by(Title: 'Test title1').id,
                   author_id: User.find(subject.id).id)
  end

  it "Redirects to the user's page" do
    get '/users'
    expect(response).to render_template(:index)
  end

  it 'Redirects to the users/:user_id/posts/ page' do
    get "/users/#{User.find(subject.id).id}/posts"
    expect(response).to render_template(:index)
  end

  it 'Redirects to the users/:user_id/posts/:id page' do
    get "/users/#{User.find(subject.id).id}/posts/#{Post.find_by(Title: 'Test title1').id}"
    expect(response).to render_template(:show)
  end

  it 'Users render the good template' do
    get '/users'
    expect(response).to render_template(:index)
  end
end
