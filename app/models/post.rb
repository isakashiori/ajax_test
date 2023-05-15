class Post < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  def save_with_tags(tag_names:) #ここがキーワード引数で受け取っているのなら、受け渡し側もキーワード引数で定義してあげないとエラーになる
    ActiveRecord::Base.transaction do
      self.tags = tag_names.map{ |tag| Tag.find_or_initialize_by(tag: tag.strip)}
      binding.pry
      save!
    end
    true
  rescue StandardError
    binding.pry
    false
  end


end
