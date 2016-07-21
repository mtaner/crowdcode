require 'rails_helper'

feature 'user mailer' do

  let!(:user) do
    User.create(email: 'owner@test.com', password: 'testtest', password_confirmation: 'testtest', name: 'Bob')
  end

  let!(:project) do
    Project.create(name: 'Test Project', user_id: user.id)
  end

  let!(:feature) do
    Feature.create(name: 'Test Feature', description: 'Test Feature', deadline: '08/09/16', project_id: project.id)
  end

  let(:mail) {UserMailer.confirmation_email(user, feature).deliver_now}

  it 'renders the subject' do
    expect(mail.subject).to eq('Congratulations from CrowdCode')
  end

  it 'renders the receiver email' do
    expect(mail.to).to eq([user.email])
  end

  it 'renders the sender email' do
    expect(mail.from).to eq(['notifications@crowdcode.com'])
  end

  it 'assigns @name' do
    expect(mail.body.encoded).to match(user.name)
  end

end