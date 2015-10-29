class Question < ActiveRecord::Base
  validates(:title, {presence:  true,
                    uniqueness: true, # to change default error message:
                                      # uniqueness: {message: "was used"}
                    length: {minimum: 3}})
  validates :body, presence: true,
                    uniqueness: {scope: :title}
                    # using scope: :title will make sure that the body is unique
                    # in combination with the title
                    # thus you cannot have same title and same body
                    # but okay to have same body with two different titles
                    # in this case, not an issue because we are requiring
                    # unique title for each entry
  validates :view_count, numericality: true # or:
                                            # numericality: {greater_than_or_equal_to: 0}
                                            # might need to comment out to get hirb select to work
  validate :no_monkey

  after_initialize :set_default_values      # might need to comment out to get hirb select to work
  before_validation :capitalize_title

#######################
  def self.recent_ten # without self., it becomes an instance method.
                      # you want this to be a CLASS method
    order("created_at DESC").limit(10)
  end
# OR USE A SCOPE AND LAMBDA:
  # scope :recent_ten, lambda { order("created_at DESC").limit(10)}

# can also do:
  def self.recent(num)
    order("created_at DESC").limit(num)
  end
#######################
  def self.search(string)
    # where(["title ILIKE? OR body ILIKE?", "%#{string}%", "%#{string}%"])
    # OR
    where(["title ILIKE :search_term OR body ILIKE :search_term", {search_term: "%#{string}%"}])

  end

  private
  def no_monkey
    if title.present? && title.downcase.include?("monkey")
      errors.add(:title, "contains monkey. No monkeys please!")
    end
  end

  def set_default_values
    self.view_count ||= 7 # if self.view_count is nil or false, it will set it to 0
  end

  def capitalize_title
    self.title.capitalize! # this is actually okay, because it only returns nil. It doesn't modify self.title
    # self.title = self.title.capitalize! would actually set self.title to nil
  end

end
