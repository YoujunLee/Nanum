class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	validates :category, :inclusion => { :in => ["중고장터", "공동구매", "나눔", "도와주세요"], :message => "카테고리를 하나 선택하셔야 합니다."}
	validates :title, :presence => { :message => "제목을 반드시 입력하셔야 합니다."}
	validates :content, :presence => { :message => "내용을 반드시 입력하셔야 합니다."}
	mount_uploader :image, ImageUploader
end
