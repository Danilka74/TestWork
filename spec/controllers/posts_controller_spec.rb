require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  context 'index' do
    it 'displays all posts' do
      post_one = Post.create(title: 'Title', body: 'Text', name: 'Name')
      post_two = Post.create(title: 'Title2', body: 'Text2', name: 'Name2')
      get :index
      expect(response.status).to eq(200)
    end
  end

  context 'show' do
    it 'show post' do
      post = Post.create(title: 'Title', body: 'Text', name: 'Name')
      get :show, params: { url: post.url }
      expect(response.status).to eq(200)
    end
  end

  context 'create' do
    it 'save post' do
      post = Post.create(title: 'Title', body: 'Text', name: 'Name', parent_id: nil)
      get :index
      expect(response.status).to eq(200)
    end
  end

  context 'update' do
    it 'update post atributes' do
      post = Post.create(title: 'Title',body: 'Text', name: 'Name')
      post.update(title: 'Title2',body: 'Text2', name: 'Name2')
      expect(post.valid?).to eq(true)
    end
  end 

end