ActiveAdmin.register Event do
  menu :label => 'The Event'
  actions :all, except: [:new, :show, :destroy]

  index do
    column :text, :sortable => false do |event|
      truncate(event.text, :length => 150)
    end
    default_actions
  end

  form :partial => 'form'
end