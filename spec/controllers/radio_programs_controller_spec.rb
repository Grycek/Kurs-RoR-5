require 'spec_helper'

describe RadioProgramsController, 'something' do
  render_views
  fixtures :radio_programs
  fixtures :users
  include Devise::TestHelpers

#  before (:each) do
#    @user = User.create(:user)
#    sign_in @user
#  end

  def mock_user(stubs={})
      @mock_user ||= mock_model(User, stubs).as_null_object
  end
  
  before(:each) do
      # mock up an authentication in the underlying warden library
      request.env['warden'] = mock(Warden, :authenticate => mock_user,
                                           :authenticate! => mock_user,
                                           :authenticate? => mock_user)
  end
  
  it "should find radioprogram after add" do
    
    post :create, :radio_program => {:user_id => 1, :playlist => "Proba123456789"}
    post 'index', :search => {:playlist_contains => "Proba123456789"}
    response.should contain("Proba123456789")
  end
end
