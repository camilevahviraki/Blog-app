require 'rails_helper'

RSpec.describe 'User_show', type: :feature do
  subject do
    User.new(Name: 'camilux',
             Photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQx5pB6py4twIFGBfFT4IS8E13iYj_pzGyKw&usqp=CAU',
             Bio: 'This is the corresponding wireframe view', PostsCounter: 3)
  end
  before :each do
    subject.save
    Post.create(Title: 'Test title1', Text: 'Test Text1', CommentsCounter: 0, LikesCounter: 0,
                author_id: User.find(subject.id).id)
    Post.create(Title: 'Test title2', Text: 'Test Text2', CommentsCounter: 0, LikesCounter: 0,
                author_id: User.find(subject.id).id)
    Post.create(Title: 'Test title3', Text: 'Test Text3', CommentsCounter: 0, LikesCounter: 0,
                author_id: User.find(subject.id).id)
  end

  it 'Added user' do
    visit "/users/#{User.find(subject.id).id}/"
    expect(page).to have_content 'camilux'
  end

  it 'Check diplayed image link' do
    visit "/users/#{User.find(subject.id).id}/"
    expect(page).to have_css("img[src*='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQx5pB6py4twIFGBfFT4IS8E13iYj_pzGyKw&usqp=CAU']")
  end

  it 'Check number of posts' do
    visit "/users/#{User.find(subject.id).id}/"
    expect(page).to have_content 'Number of posts: 3'
  end

  it 'Display the users Bio' do
    visit "/users/#{User.find(subject.id).id}/"
    expect(page).to have_content 'This is the corresponding wireframe view'
  end

  it 'See the last 3 posts' do
    visit "/users/#{User.find(subject.id).id}/"
    expect(page).to have_content 'Test Text1'
  end

  it 'See the last 3 posts' do
    visit "/users/#{User.find(subject.id).id}/"
    expect(page).to have_content 'Test Text2'
  end

  it 'See the lastest posts' do
    visit "/users/#{User.find(subject.id).id}/"
    expect(page).to have_content Post.last.Text
  end

  it "When I click a user's post, it redirects me to that post's show page." do
    visit "/users/#{User.find(subject.id).id}/"
    click_link('Test title1')
    expect(page)
    .to have_current_path("/users/#{User.find(subject.id).id}/posts/#{Post.find_by(Title: 'Test title1').id}")
  end

  it "When I click to see all posts, it redirects me to the user's post's index page." do
    visit "/users/#{User.find(subject.id).id}/"
    click_on('See all posts')
    expect(page).to have_current_path("/users/#{User.find(subject.id).id}/posts")
  end
end
