require 'spec_helper'
require 'helpers/examples'

require 'yard-dm/belongs_to_handler'
require 'yard-dm/legacy/belongs_to_handler'

describe "BelongsToHandler" do
  include Helpers::Examples

  describe "valid" do
    before(:all) do
      parse_file :simple_belongs_to
    end

    it "should define class-methods for the belongs_to relationships" do
      yard('SimpleBelongsTo.author').should be_instance_of(CodeObjects::MethodObject)
    end

    it "should define reader methods for the belongs_to relationships" do
      yard('SimpleBelongsTo#author').should be_instance_of(CodeObjects::MethodObject)
    end

    it "should define writer methods for the belongs_to relationships" do
      yard('SimpleBelongsTo#author=').should be_instance_of(CodeObjects::MethodObject)
    end
  end

  describe "invalid" do
    before(:all) do
      parse_file :invalid_belongs_to
    end

    it "should not define class-methods for 'belongs_to' variables" do
      yard('InvalidBelongsTo.author').should be_nil
    end

    it "should not define reader methods for 'belongs_to' variables" do
      yard('InvalidBelongsTo#author').should be_nil
    end

    it "should not define writer methods for 'belongs_to' variables" do
      yard('InvalidBelongsTo#author=').should be_nil
    end
  end
end
