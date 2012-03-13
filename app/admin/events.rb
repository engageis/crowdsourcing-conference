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

  # controller do
  #   def new
  #     @event = Event.new
  #     LOCALES.each do |lang|
  #       @event.event_translations.find_or_initialize_by_locale(lang[0])
  #     end
  #   end
  # end
  
  
  
  
  
  # actions :all
  #   index do
  #     column :text
  #     default_actions
  #   end
  # 
  #   filter :text
  # 
  #   form do |f|
  #     f.inputs do
  #       f.has_many :event_translations do |g|
  #         g.input :locale, :as => :radio, :collection => LANGUAGES
  #         g.input :text, :as => :text
  #       end
  #     end
  #     f.buttons
  #   end

end