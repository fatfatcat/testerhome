# coding: utf-8
class SearchController < ApplicationController
  def index
    @topics = Topic.search(
        query: {
            multi_match: {
                query: params[:q],
                fields: %w(title body),
                fuzziness: 2
            }
        },
        highlight: {
            fields: {
                title: {},
                body: {}
            }
        }
    ).paginate(page: params[:page], per_page: 10).records
    @count = @topics.total_entries
  end
end
