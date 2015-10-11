class All
  include Inesita::Component

  def render
    dom do
      store.all.each do |todo|
        component Item, props: todo
      end
    end
  end
end

