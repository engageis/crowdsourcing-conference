ActiveAdmin.register Profile do
  actions :all, except: [:show]

  index do
    column :position
    column "Type", :kind
    column :name
    column :company
    column :country
    default_actions
  end

  filter :kind, label: "Type", :as => :select, :collection => Profile::KINDS
  form :partial => 'form'
end
