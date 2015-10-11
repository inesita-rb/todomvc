class Completed
  include Inesita::Component

  def render
    dom do
      store.completed.each do |todo|
        component Item, props: todo
      end
    end
  end
end

