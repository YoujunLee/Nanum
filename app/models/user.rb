class User < ActiveRecord::Base
	has_many :posts
	has_many :comments

# username = nickname 
# password = password
# code = student_number

	validates :username, :presence => { :message => "별명을 반드시 입력하셔야 합니다" }           										
	validates :username, :uniqueness => { :message => "이미 존재하는 닉네임입니다.", :case_sensitive => false }
	validates :password, :length => { :minimum =>6, :too_short => "최소 6자 이상의 비밀번호를 입력하셔야 합니다." }
	validates :code, :presence => { :message => "학번을 반드시 입력하셔야 합니다" }
	validates :code, :uniqueness => { :message => "이미 존재하는 사용자입니다.", :case_sensitive => false }
	validates :code, :length => { :is => 8, :too_short => "존재하지 않는 학번 입니다.", :too_long => "존재하지 않는 학번입니다."}

end
