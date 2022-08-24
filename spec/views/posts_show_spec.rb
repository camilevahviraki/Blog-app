require 'rails_helper'

RSpec.describe "Users_Index", type: :feature do
   
  subject { User.new(Name: 'camilux', Photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQx5pB6py4twIFGBfFT4IS8E13iYj_pzGyKw&usqp=CAU', Bio: 'kefjwckllkl', PostsCounter: 0)}
  
    before :each do
     subject.save
     Post.create(Title: 'Test title1', Text: 'Test Text1', CommentsCounter: 1, LikesCounter: 0, author_id: User.find(subject.id).id)
     Post.create(Title: 'Test title2', Text: 'Test Text2', CommentsCounter: 0, LikesCounter: 0, author_id: User.find(subject.id).id)
     Post.create(Title: 'Test title3', Text: 'Test Text3', CommentsCounter: 0, LikesCounter: 0, author_id: User.find(subject.id).id)
     Comment.create(Text: 'Comment number1 test', posts_id: Post.find_by(Title: 'Test title1').id, author_id: User.find(subject.id).id)
    end

    it "I can see a posts title" do
        visit "/users/#{User.find(subject.id).id}/posts/#{Post.find_by(Title: 'Test title1').id}"
        expect(page).to have_content 'Test Text1'
    end
    
    it "I can see how many comments a post has" do
        visit "/users/#{User.find(subject.id).id}/posts/#{Post.find_by(Title: 'Test title1').id}"
        expect(page).to have_content 'Comments: 1'
    end  

    it "I can see how many likess a post has" do
        visit "/users/#{User.find(subject.id).id}/posts/#{Post.find_by(Title: 'Test title1').id}"
        expect(page).to have_content 'Likes: 0'
    end
    
    it "I can see the post body" do
        visit "/users/#{User.find(subject.id).id}/posts/#{Post.find_by(Title: 'Test title1').id}"
        expect(page).to have_content 'Test Text1'
    end

    it "I can see the username of each commentor" do
        visit "/users/#{User.find(subject.id).id}/posts/#{Post.find_by(Title: 'Test title1').id}"
        expect(page).to have_content 'camilux'
    end
    
    it "I can see the comment each commentor left" do
        visit "/users/#{User.find(subject.id).id}/posts/#{Post.find_by(Title: 'Test title1').id}"
        expect(page).to have_content 'Comment number1 test'
    end

  end