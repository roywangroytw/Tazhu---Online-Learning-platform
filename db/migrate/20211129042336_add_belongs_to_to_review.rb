class AddBelongsToToReview < ActiveRecord::Migration[6.1]
  def change
    add_reference(:reviews, :course, index: true)
    # add_belongs_to(:reviews, :course, index: true)
    # add_column :reviews, :course_id, :integer
  end
end
