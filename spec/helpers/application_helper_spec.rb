require 'rails_helper'
require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

RSpec.describe ApplicationHelper, type: :helper do
  describe "#markdown" do
    it "returns markdown text as html" do
      text = "This is some *interesting* text"
      html = "<p>This is some <em>interesting</em> text</p>\n"
      expect(markdown(text)).to eq(html)
    end
  end

  describe "#disable_class" do

    xit 'returns "disable" if role is equal to user.role' do
      # TODO: Figure out why this mock isn't working for me
      allow(user).to receive(:role).and_return("premium")
      expect(disable_class @user, "premium" ).to eq("disabled")
    end

    xit 'returns "" if role is not equal to user.role' do
      # TODO: Figure out why this mock isn't working for me
      allow(user).to receive(:role).and_return("premium")
      expect(disable_class @user, "free" ).to eq("")
    end
  end
end
