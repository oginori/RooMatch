class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  storage :file
  process :resize_to_fill => [500, 500, 'Center']


  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
