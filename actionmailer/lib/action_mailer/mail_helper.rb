module ActionMailer
  module MailHelper
    # Uses Text::Format to take the text and format it, indented two spaces for
    # each line, and wrapped at 72 columns.
    def block_format(text)
      formatted = text.split(/\n\r\n/).collect { |paragraph|
        Text::Format.new(
          :columns => 72, :first_indent => 2, :body_indent => 2, :text => paragraph
        ).format
      }.join("\n")
    
      # Make list points stand on their own line
      formatted.gsub!(/[ ]*([*]+) ([^*]*)/) { |s| "  #{$1} #{$2.strip}\n" }
      formatted.gsub!(/[ ]*([#]+) ([^#]*)/) { |s| "  #{$1} #{$2.strip}\n" }
 
      formatted
    end

    # Access the mailer instance.
    def mailer #:nodoc:
      @_controller
    end

    # Access the message instance.
    def message #:nodoc:
      @message
    end
  end
end
