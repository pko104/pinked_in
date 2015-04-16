class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fill: [150, 150]

  def filename
    "profilephoto.png" if original_filename
  end

end
