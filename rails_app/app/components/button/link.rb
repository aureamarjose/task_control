# frozen_string_literal: true

module Components
  module Button
    class Link < Components::Base
      def initialize(link:, background:, text_color:, hover_bg:, hover_text:, title:)
        super()
        @link = link
        @background = background
        @hover_bg = hover_bg
        @text_color = text_color
        @hover_text = hover_text
        @title = title
      end

      def view_template
        link_to(@link, data: { turbo_stream: true }, class: "flex items-center justify-center w-full #{@text_color} #{@hover_text} #{@background} #{@hover_bg} focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800") do
          span { @title }
        end
      end
    end
  end
end
