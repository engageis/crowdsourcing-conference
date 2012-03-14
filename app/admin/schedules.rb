ActiveAdmin.register Schedule do
  actions :all, except: [:show]

  index do
    column :day do |c|
      if c.day == 1
        "First day"
      elsif c.day == 2
        "Second day"
      end
    end
    column :time do |c|
      "#{c.time.hour}:#{c.time.min}"
    end
    column :description, :sortable => false do |c|
      truncate(c.description, :length => 100)
    end
    default_actions
  end

  filter :day, :as => :select, :collection => {"Frist day" => 1, "Second day" => 2}
  form :partial => 'form'
end
