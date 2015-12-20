class Active
  include Inesita::Component

  def render
    store.active.each do |todo|
      component Item, props: todo
    end
  end
end
