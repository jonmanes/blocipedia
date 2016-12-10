class WikiPolicy < ApplicationPolicy

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      elsif user.premium?
        scope.where(private: true, user_id: user.id) | scope.where(private: false)
      else
        scope.where(private: false) | user.wiki_collaborations
      end
    end
  end
end
