module ApplicationHelper
  BASE_TITLE = 'Portfolio'.freeze

  def full_title(page_title: '')
    if page_title.blank?
      BASE_TITLE
    else
      "#{page_title} - #{BASE_TITLE}"
    end
  end

  def save_image(url)
    # ready filepath
    fileName = File.basename(url).split("?").first
    dirName = "app/assets/images/parlors/andpeople_ginza/"
    filePath = dirName + fileName

    # write image adata
    open(url) do |image|
      File.open(filePath, "wb") do |file|
        file.puts image.read
      end
    end
  end
end
