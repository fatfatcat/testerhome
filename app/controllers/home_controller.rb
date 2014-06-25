# coding: utf-8
class HomeController < ApplicationController
  def index
    @excellent_topics = Topic.excellent.recent.fields_for_list.includes(:user).limit(20).to_a
    @latest_topics = Topic.recent.fields_for_list.includes(:user).limit(10).to_a
    fresh_when(etag: [@excellent_topics, @latest_topics, SiteConfig.index_html])
  end

  def api
  end

  def twitter
  end
end
