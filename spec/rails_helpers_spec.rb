require 'spec_helper'

describe "rails helpers" do

  let(:template)    { load_fixture :rails_helper }
  let(:slim_output) { load_fixture :rails_helper_output_slim, :html }
  let(:haml_output) { load_fixture :rails_helper_output_haml, :html }
  let(:erb_output)  { load_fixture :rails_helper_output_erb, :html }

  describe "slim" do

    before(:each) do
      Shortcode.setup do |config|
        config.template_parser = :slim
        config.template_path = File.join File.dirname(__FILE__), "support/templates/slim"
      end
    end

    it "are accessible within slim templates" do
      Shortcode.process(template).gsub("\n",'').should == slim_output.gsub("\n",'')
    end

  end

  describe "haml" do

    it "are accessible within haml templates" do
      Shortcode.process(template).gsub("\n",'').should == haml_output.gsub("\n",'')
    end

  end

  describe "erb" do

    before(:each) do
      Shortcode.setup do |config|
        config.template_parser = :erb
        config.template_path = File.join File.dirname(__FILE__), "support/templates/erb"
      end
    end

    it "are accessible within erb templates" do
      Shortcode.process(template).gsub("\n",'').should == erb_output.gsub("\n",'')
    end

  end

end
