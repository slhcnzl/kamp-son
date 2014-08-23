# encoding: utf-8

module NoticeHelper
  def has_a_picture
    if @notice.noticeimage.url == nil
      image_tag("ilan.png", size: "180x180")
    else
      image_tag(@notice.noticeimage, size: "200x200")
    end
  end

  def has_a_thumb(ilan)
    if ilan.noticeimage.url == nil
      image_tag("ilan.png", size: "50x50")
    else
      image_tag(ilan.noticeimage, size: "50x50")
    end
  end
end