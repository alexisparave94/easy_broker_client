class Property
  attr_reader :public_id,
              :title,
              :description,
              :property_images,
              :title_image_thumb,
              :property_type,
              :location

  def initialize(data)
    @public_id = data["public_id"]
    @title = data["title"]
    @description = data["description"]
    @property_images = data["property_images"]
    @title_image_thumb = data["title_image_thumb"]
    @property_type = data["property_type"]
    @location = data["location"]
  end
end
