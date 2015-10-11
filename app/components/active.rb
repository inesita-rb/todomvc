class Active
  include Inesita::Component

  def render
    dom do
      store.active.each do |todo|
        component Item, props: todo
      end
    end
  end
end

