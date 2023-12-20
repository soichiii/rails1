class Post < ApplicationRecord
    validates :title, presence: true
    validates :title, length: {maximum:20}
    validates :start, presence: true
    validates :finish, presence: true
    validates :memo, length: {maximum:500}
    validates :start,:finish, presence: false , if: :start_finish_check

    def start_finish_check
        errors.add(:finish, "は開始時刻より遅い時間を選択してください") if self.start > self.finish && start.nil?
       end

end
