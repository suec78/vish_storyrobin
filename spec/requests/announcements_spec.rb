require 'spec_helper'

describe "Announcements" do
  it "displays active announcements" do
    Announcement.create! message: "New Contest", starts_at: 1.hour.ago, ends_at: 1.hour.from_now
    Announcement.create! message: "Upcoming", starts_at: 10.minutes.from_now, ends_at: 1.hour.from_now
    visit root_path
    page.should have_content("New Contest")
    page.should_not have_content("Upcoming")
    click_on "hide announcement"
    page.should_not have_content("New Contest")
  end
  
  it "stays on page when hiding announcement with javascript", js: true do
    Announcement.create! message: "New Contest", starts_at: 1.hour.ago, ends_at: 1.hour.from_now
    visit root_path
    page.should have_content("New Contest")
    expect { click_on "hide announcement" }.to_not change { page.response_headers }
    page.should_not have_content("New Contest")
  end
end
