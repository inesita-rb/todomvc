class Router
  include Inesita::Router

  def routes
    route '/', to: All
    route '/active', to: Active
    route '/completed', to: Completed
  end
end

