require 'rails_helper'

RSpec.describe Post, type: :model do

  context 'validation url' do

    it 'url presence?' do
      post = Post.create(title: 'Title',body: 'Text')
      expect(post.errors.include?(:url)).to eq(true)
    end

    it 'should save successfully' do
      post = Post.create(title: 'Title',body: 'Text', name: 'Name')
      expect(post.errors.size).to eq(0)
    end

  end

  context 'URL generator' do

    it 'parent present' do
      post_one = Post.create(title: 'Title', body: 'Text', name: 'Name')
      post_two = post_one.children.create(title: 'Title2',body: 'Text2', name: 'Name2')
      expect(post_two.url).to eq("name/name2")
    end

    it 'without parent' do
      post = Post.create(title: 'Title',body: 'Text', name: 'Name', ancestry: nil)
      expect(post.url).to eq("name")
    end

  end

end
