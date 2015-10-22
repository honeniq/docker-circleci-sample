require 'spec_helper'

# Workaround needed for circleCI
if ENV['CIRCLECI']
  class Docker::Container
    def remove(options={}); end
    alias_method :delete, :remove
  end
end

describe "nginx" do
  describe package("nginx") do
    it { should be_installed }
  end

  describe file("/usr/share/nginx/html/index.html") do
    its(:content) { should match /Welcome to Chubo Deshita\? container/ }
    its(:content) { should_not match /Welcome to nginx/ }
  end

  describe file('/usr/share/nginx/html/whale.png') do
    it { should be_file }
  end
end
