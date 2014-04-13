class ForumsController < ApplicationController
  before_filter :set_breadcrumb

  def index
    @forums = Forum.by_parent
  end

  private
    def set_breadcrumb
      add_breadcrumb I18n.t('forum-list'), forums_path
    end
end
