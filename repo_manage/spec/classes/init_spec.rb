require 'spec_helper'
describe 'repo_manage' do
  context 'with default values for all parameters' do
    it { should contain_class('repo_manage') }
  end
end
