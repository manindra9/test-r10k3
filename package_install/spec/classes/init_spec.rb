require 'spec_helper'
describe 'package_install' do
  context 'with default values for all parameters' do
    it { should contain_class('package_install') }
  end
end
