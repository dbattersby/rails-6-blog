class Post < ApplicationRecord
  validates :title, presence: true
  validates :summary, presence: true
  validates :body, presence: true

  belongs_to :category

  # callbacks - validation / save / create /update / destroy
  after_create :update_total_posts_count

  scope :active, -> { where( active: true ) }
  scope :order_by_latest_first, -> { order( created_at: :desc ) }
  scope :limit_2, -> { limit( 2 ) }

  private

  def update_total_posts_count
    # update category total count column to show total posts count
    category.increment(:total_count, 1).save
  end

end
