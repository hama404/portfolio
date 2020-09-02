module ApplicationHelper
  BASE_TITLE = 'Portfolio'.freeze

  def full_title(page_title: '')
    if page_title.blank?
      BASE_TITLE
    else
      "#{page_title} - #{BASE_TITLE}"
    end
  end

  def save_image(src, name)
    dirName = "app/assets/images/parlors/"

    # ready filepath
    file = File.basename(src).split("?").first
    dir = name.downcase.gsub(" ","_")
    dirPath = dirName + dir + "/"
    filePath = dirPath + file

    # create folder if not exist
    FileUtils.mkdir_p(dirPath) unless FileTest.exist?(dirPath)

    # write image adata
    open(src) do |image|
      File.open(filePath, "wb") do |file|
        file.puts image.read
      end
    end
  end
end
