require 'spec_helper'

describe "Basic behavior" do
  context 'for enabled tables' do
    it 'should log create actions' do
      Post.create! title: "Foo", content: "Bar"
    end

    it 'should log update actions' do
      p = Post.create! title: "Foo", content: "Bar"
      p.update_attributes :title => "FooBar"
    end
  end

  context 'for not enabled tables' do
    it 'should do nothing'
  end
end
