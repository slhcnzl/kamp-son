class AddNoticeimageToNotices < ActiveRecord::Migration
  def change
    add_column :notices, :noticeimage, :string
  end
end
