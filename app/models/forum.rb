class Forum < ActiveRecord::Base
  def self.by_parent
    forums_by_parent = {}
    Forum.all.order(:parent, :order).each do |forum|
      forums_by_parent[forum[:parent]] ||= []
      forums_by_parent[forum[:parent]] << forum
    end
    return forums_by_parent
  end
end
