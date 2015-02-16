require 'spec_helper'

describe "App data" do
  it 'should be possible to set app data that gets saved with edits' do
    AuditTriggerRails.app_data = { edit_id: "1", current_user_id: "2", current_user_name: "Jack Black" }

    Post.create! title: "Foo", content: "Bar"

    app_data = LoggedAction.first.app_data
    expect(app_data["edit_id"]).to eql("1")
    expect(app_data["current_user_id"]).to eql("2")
    expect(app_data["current_user_name"]).to eql("Jack Black")
  end

  it 'should be possible to fetch app_data that was set' do
    AuditTriggerRails.app_data = { edit_id: "1", current_user_id: "2", current_user_name: "Jack Black" }

    expect(AuditTriggerRails.app_data).to eql({ "edit_id" => "1", "current_user_id" => "2", "current_user_name" => "Jack Black" })
  end


  it 'should be possible to re-set app data' do
    AuditTriggerRails.app_data = nil

    Post.create! title: "Foo", content: "Bar"

    app_data = LoggedAction.first.app_data
    expect(app_data).to be_nil

    expect(AuditTriggerRails.app_data).to be_nil
  end
end

