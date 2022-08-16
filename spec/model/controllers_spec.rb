require 'rails_helper'

RSpec.describe 'Controllers', type: :request do
  it "Redirects to the user's page" do
    get '/users'
    expect(response).to render_template(:index)
  end

  it "Redirects to the user's/:id page" do
    get '/users/1'
    expect(response).to render_template(:show)
  end

  it 'Redirects to the users/:user_id/posts/ page' do
    get '/users/1/posts'
    expect(response).to render_template(:index)
  end

  it 'Redirects to the users/:user_id/posts/:id page' do
    get '/users/1/posts/2'
    expect(response).to render_template(:show)
  end

  it 'Users render the good template' do
    get '/users'
    expect(response).to render_template(:index)
  end

  it 'Users/:id render the good template' do
    get '/users/2'
    expect(response).to render_template(:show)
  end

  it 'Users/:id/posts render the good template' do
    get '/users/2/posts'
    expect(response).to render_template(:index)
  end

  it 'Users/:id/posts/:post_id render the good template' do
    get '/users/2/posts/8'
    expect(response).to render_template(:show)
  end

  it 'Users include text' do
    get '/users'
    expect(response.body).to include('Here the list of all users')
  end

  it 'Users/:id include text' do
    get '/users/1'
    expect(response.body).to include('Here is the details of given user')
  end

  it 'Users/:user_id/posts include text' do
    get '/users/1/posts'
    expect(response.body).to include('Here show posts for a given user')
  end

  it 'Users/:user_id/posts/:id include text' do
    get '/users/1/posts/23'
    expect(response.body).to include('Here show a selected post for a given user')
  end
end
