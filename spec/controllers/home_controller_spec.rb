require 'spec_helper'

describe HomeController do
  render_views
  subject { get :index }
  it{ should be_success }
end
