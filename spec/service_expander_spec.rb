# frozen_string_literal: true

require_relative "../lib/service_expander.rb"

RSpec.describe ServiceExpander do
  let(:input) { "some keyword list" }

  subject { described_class.new(input: input).call }

  it "takes a list of keywords and creates a service" do
    expect(subject).to eq <<~RUBY
      attr_reader :some, :keyword, :list
      private :some, :keyword, :list

      def initialize(some: some, keyword: keyword, list: list)
        @some = some
        @keyword = keyword
        @list = list
      end
    RUBY
  end

  context "when the keyword input is symbols" do
    let(:input) { ":some :keyword :list" }

    it "strips the colons before generating the template" do
      expect(subject).to eq <<~RUBY
        attr_reader :some, :keyword, :list
        private :some, :keyword, :list

        def initialize(some: some, keyword: keyword, list: list)
          @some = some
          @keyword = keyword
          @list = list
        end
      RUBY
    end
  end
end
