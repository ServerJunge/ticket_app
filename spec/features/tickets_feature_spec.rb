require 'spec_helper'

describe 'invitations' do
  let!(:account) { create(:account_with_schema) }
  let(:user) { account.owner }

  before do
    set_subdomain(account.subdomain)
    sign_user_in(user)
  end

  it "allows tickets to be created" do
    visit root_path
    click_link "New ticket"

    fill_in "Name", with: "A great ticket"
    fill_in "Client", with: "NASA"
    expect(page).to_not have_text "Archived"
    click_button "Create ticket"

    expect(page).to have_text "Ticket created!"
    expect(page).to have_text "A great ticket"
  end

  it "displays ticket validations" do
    visit root_path
    click_link "New ticket"

    click_button "Create ticket"
    expect(page).to have_text "can't be blank"
  end

  it "allows tickets to be edited" do
    ticket = create(:ticket)

    visit root_path
    click_edit_ticket_button ticket.name

    fill_in "Name", with: "A new name"
    check "Archived"
    click_button "Update Ticket"

    expect(page).to have_text "Ticket updated!"
    expect(page).to have_text "A new name"
  end

  def click_edit_ticket_button(ticket_name)
    within find("h3", text: ticket_name) do
      page.first("a").click
    end
  end
end
