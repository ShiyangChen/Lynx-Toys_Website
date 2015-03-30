class Creation<ActiveRecord::Base
    #has_many :picture
    #before_destroy :ensure_not_referenced_by_any_picture
	
    has_attached_file :image
    #has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	
    def ensure_not_referenced_by_any_pircture
        if pictures.count.zero?
           return true
        else
            errors[:base]<<"Pictures present"
            return false
        end
    end
	
end



