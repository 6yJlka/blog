require 'test_helper'

class BlogPostTest < ActiveSupport::TestCase
  test 'should not save blog post without title' do
    post = BlogPost.new
    assert_not post.save, 'Saved the blog post without a title'
  end
end
