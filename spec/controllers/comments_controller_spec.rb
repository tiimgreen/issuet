require 'spec_helper'

describe CommentsController do
  describe 'POST #create' do
    context 'when user signed in' do
      login_user!

      it 'should redirect to the newly created project path' do
        project = FactoryGirl.create(:project)
        issue = FactoryGirl.create(:issue, project: project)
        comment = FactoryGirl.build(:comment, issue: issue, user: @user)

        post :create, project_id: project.name, issue_id: issue.number,
                      comment: { body: comment.body }

        expect(response).to redirect_to(
          "/projects/#{project.name}/issues/#{issue.number}")
      end
    end
  end
end
