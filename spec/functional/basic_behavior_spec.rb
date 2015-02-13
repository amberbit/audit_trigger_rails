require 'spec_helper'

describe "Basic behavior" do
  context 'for enabled tables' do
    it 'should log create actions' do
      expect {
        Post.create! title: "Foo", content: "Bar"
      }.to change { LoggedAction.count }.by(1)

      row_data = LoggedAction.first.row_data
      expect(row_data["id"]).to eql(Post.first.id.to_s)
      expect(row_data["title"]).to eql(Post.first.title)
      expect(row_data["content"]).to eql(Post.first.content)
    end

    it 'should log update actions' do
      p = Post.create! title: "Foo", content: "Bar"
      p.update_attributes :title => "FooBar"

      expect(LoggedAction.count).to eq(2)

      row_data = LoggedAction.order("created_at desc").first.row_data
      expect(row_data["id"]).to eql(Post.first.id.to_s)
      expect(row_data["title"]).to eql("Foo")

      log = LoggedAction.order("created_at desc").last
      expect(log.row_data["title"]).to eql("Foo")
      expect(log.changed_fields["title"]).to eql("FooBar")
    end
  end

  context 'for not enabled tables' do
    it 'should do nothing' do
      expect {
        User.create! email: "foo@example.com"
      }.not_to change { LoggedAction.count }
    end
  end
end

