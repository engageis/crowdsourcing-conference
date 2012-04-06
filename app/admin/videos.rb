ActiveAdmin.register Video do
  index do
    column :title
    column :link
    default_actions
  end

  form do |f|
    f.inputs do
      if f.object.new_record?
        f.input :link
      else
        f.input :title
        f.input :description
        f.input :thumbnail_small
        f.input :thumbnail_large
      end
    end
    f.buttons
  end

  filter :title
  filter :link
end