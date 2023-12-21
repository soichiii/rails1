class Post < ApplicationRecord
    validates :title, presence: true
    validates :title, length: {maximum:20}
    validates :start, presence: true
    validates :finish, presence: true
    validates :memo, length: {maximum:500}
    validate :start_finish_check

    private

    def start_finish_check
        return if start.blank? || finish.blank?

        if finish <= start
        errors.add(:finish, "は開始時刻より遅い時間を選択してください")
       end
    end   

end
