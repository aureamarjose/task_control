# frozen_string_literal: true

module Components
  module Button
    class Submit < Components::Base
      def initialize(form:, title:, background:, text_color:, hover_bg:, hover_text:)
        super()
        @form = form
        @title = title
        @background = background
        @hover_bg = hover_bg
        @text_color = text_color
        @hover_text = hover_text
      end

      def view_template
        @form.submit(@title, class: "#{@text_color} #{@hover_text} #{@background} #{@hover_bg} cursor-pointer focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800")
      end
    end
  end
end
