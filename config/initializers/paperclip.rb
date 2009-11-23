Paperclip.interpolates :name do |attachment, style|
  attachment.instance.name
end

Paperclip.interpolates :title do |attachment, style|
  attachment.instance.title
end

Paperclip.interpolates :category do |attachment, style|
  attachment.instance.category + '-' + attachment.instance.id.to_s
end