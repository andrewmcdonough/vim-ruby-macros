# frozen_string_literal: true

class ServiceExpander
  attr_reader :input
  private :input

  def initialize(input:)
    @input = input
  end

  def call
    <<~RUBY
      attr_reader #{symbolized_keywords_string}
      private #{symbolized_keywords_string}

      def initialize(#{constructor_params})
      #{constructor_body}
      end
    RUBY
  end

  private

  def constructor_params
    keywords.map { |k| "#{k}: #{k}" }.join(", ")
  end

  def constructor_body
    keywords.map { |k| "  @#{k} = #{k}" }.join("\n")
  end

  def symbolized_keywords_string
    symbolized_keywords.join(", ")
  end

  def symbolized_keywords
    keywords.map do |k|
      ":#{k}"
    end
  end

  def keywords
    input.gsub(":", "").split(" ")
  end
end
