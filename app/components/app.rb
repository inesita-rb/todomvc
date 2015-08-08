class App
  include Inesita::Component

  components %i(
    _header
    _main
    _footer
  )

  def initialize
    @_header ||= Header.new
    @_main   ||= Main.new
    @_footer ||= Footer.new
  end

  def render
    dom do
      div do
        component _header
        component _main
        component _footer
      end
    end
  end
end
