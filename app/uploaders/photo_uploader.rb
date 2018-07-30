class PhotoUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  process :tags => ['lawyer_photo']

  version :standard

  def public_id
    return model.name
  end

end
