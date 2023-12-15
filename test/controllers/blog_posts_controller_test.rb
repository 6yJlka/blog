require 'test_helper'

class BlogPostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
  end

  test 'should get index' do
    get blog_posts_url
    assert_response :success
  end

  test 'should get show' do
    blog_post = BlogPost.create(title: 'Test Post', body: 'Lorem ipsum', user: @user)
    get blog_post_url(blog_post)
    assert_response :success
  end

  test 'should get new' do
    get new_blog_post_url
    assert_response :success
  end


  test 'should get edit' do
    blog_post = BlogPost.create(title: 'Test Post', body: 'Lorem ipsum', user: @user)
    get edit_blog_post_url(blog_post)
    assert_response :success
  end

  test 'should update blog post' do
    blog_post = BlogPost.create(title: 'Test Post', body: 'Lorem ipsum', user: @user)
    patch blog_post_url(blog_post), params: { blog_post: { title: 'Updated Post' } }
    assert_redirected_to blog_post_url(blog_post)
    blog_post.reload
    assert_equal 'Updated Post', blog_post.title
  end

  test 'should destroy blog post' do
    blog_post = BlogPost.create(title: 'Test Post', body: 'Lorem ipsum', user: @user)
    assert_difference('BlogPost.count', -1) do
      delete blog_post_url(blog_post)
    end

    assert_redirected_to root_url
  end
end
