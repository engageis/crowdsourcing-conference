require 'spec_helper'

describe HomeController do
  subject { get :index }
  it{ should be_success }
end
