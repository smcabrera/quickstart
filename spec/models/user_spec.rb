require 'rails_helper'
require 'pry'

RSpec.describe User, type: :model do

  it 'should default to standard (free) role' do
    user = create(:user)
    expect(user.role).to eq("free")
  end

  it "should be able to set a user's role to admin" do
    user = create(:user)
    user.role = "admin"
    expect(user.role).to eq("admin")
  end

  it "should be able to set a user's role to premium" do
    user = create(:user)
    user.role = "premium"
    expect(user.role).to eq("premium")
  end

  describe "collaborates_on?" do
    before do
      @alice = create(:premium_user)
      @bob = create(:premium_user)
      @bobs_wiki = @bob.wikis.create(:private => true, :user_id => @bob.id)
    end

    it "returns false when the user is not a collaborator on given wiki" do
      expect(@alice.collaborates_on?(@bobs_wiki)).to be(false)
    end

    it "returns true when the user is a collaborator on given wiki" do
      Collaboration.create(:user_id => @alice.id, :wiki_id => @bobs_wiki.id)
      expect(@alice.collaborates_on?(@bobs_wiki)).to be(true)
    end

    it "returns true if the user owns the wiki (users are collaborators on their own wikis)" do
      expect(@bob.collaborates_on?(@bobs_wiki)).to be(true)
    end
  end
end
