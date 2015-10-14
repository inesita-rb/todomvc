class All
  include Inesita::Component

  def render
    store.all.each do |todo|
      component Item, props: todo
    end
  end
end

