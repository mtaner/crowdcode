require 'rails_helper'

describe Project do
  #subject(:project) { described_class.new }

  let!(:user) { User.create(email: 'owner@test.com', password: 'testtest',
              password_confirmation: 'testtest')}

  let!(:project) { Project.create(name: 'Test Project', user_id: user.id, launch_date: '01/11/16')}


  let!(:feature1) { Feature.create(name: 'Feature name',
                  description: 'Feature description', deadline: '08/09/16', project: project)}

  let!(:feature2) { Feature.create(name: 'Feature name',
                  description: 'Feature description', deadline: '08/09/16', project: project)}

  let!(:request)  {Request.create(feature_id: feature2.id, assigned: true, user_id: user.id)}

  context '#progress' do
    it 'calculates proportion of features that have been assigned' do
      expect(project.progress).to eq 0.5
    end
  end
end
