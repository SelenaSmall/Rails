class OrganisationPolicy < ApplicationPolicy
  attr_reader :current_user, :organisation
  def initialize(current_user, organisation)
    @current_user = current_user
    @organisation = organisation
  end

  def update?
    @current_user.admin? or @organisation.user == @current_user
  end

  def destroy?
      @current_user.admin? or @organisation.user == @current_user
  end
end