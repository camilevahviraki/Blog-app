require 'rails_helper'

RSpec.describe "Users_Index", type: :feature do
   
  subject { User.new(Name: 'camilux', Photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQx5pB6py4twIFGBfFT4IS8E13iYj_pzGyKw&usqp=CAU', Bio: 'kefjwckllkl', PostsCounter: 0)}
  
    before :each do
     subject.save
     User.create(Name: 'John Jones', Photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQx5pB6py4twIFGBfFT4IS8E13iYj_pzGyKw&usqp=CAU', Bio: 'Fighter', PostsCounter: 2)
    end
  
    it "Added user" do
      visit "/users"
      expect(page).to have_content 'camilux'
    end
    
    it "Added another user" do
      visit "/users"
      expect(page).to have_content 'John Jones'
    end

    it "See number of posts for user 2" do
        visit "/users"
        expect(page).to have_content 'Number of posts: 2'
    end

    it "Click on user name" do
        visit "/users"
        click_link('camilux')
        expect(page).to have_content 'Number of posts: 0'
    end

    it "Click on user name" do
        visit "/users"
        click_link('John Jones')
        expect(page).to have_current_path("/users/#{User.find_by(Name: 'John Jones').id}")
    end

  end