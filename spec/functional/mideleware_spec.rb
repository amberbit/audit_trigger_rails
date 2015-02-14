require 'spec_helper'

describe PostsController, :type => :request do
  it 'should not prevent setting app data' do
    get "/posts/create?title=foo&content=bar&edit_id=2"
    expect(LoggedAction.last.app_data).to eq({"edit_id" => "2"})
  end

  it 'should clear app data before each request' do
    get "/posts/create?title=foo&content=bar&edit_id=2"
    get "/posts/create?title=bar&content=foo"
    expect(LoggedAction.last.app_data).to be_nil
  end
end
