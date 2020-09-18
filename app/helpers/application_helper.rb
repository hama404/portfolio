module ApplicationHelper
  BASE_TITLE = 'Portfolio'.freeze

  def full_title(page_title: '')
    if page_title.blank?
      BASE_TITLE
    else
      "#{page_title} - #{BASE_TITLE}"
    end
  end

  def save_image(src, name: nil)
    dir_path = "app/assets/images/"
    if name
      dir = name.downcase.gsub(" ", "_")
      dir_path += dir + "/"

      # create folder if not exist
      FileUtils.mkdir_p(dir_path) unless FileTest.exist?(dir_path)
    end

    # ready filepath
    file = File.basename(src).split("?").first
    file_path = dir_path + file

    # write image adata
    open(src) do |image|
      File.open(file_path, "wb") do |f|
        f.puts image.read
      end
    end
  end
end
