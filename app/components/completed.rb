class Completed
  include Inesita::Component

  def render
    store.completed.each do |todo|
      component Item, props: todo
    end
  end
end

