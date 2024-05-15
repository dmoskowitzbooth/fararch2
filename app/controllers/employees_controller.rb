class EmployeesController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :created_at => :desc })

    render({ :template => "users/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_users = User.where({ :id => the_id })

    @the_user = matching_users.at(0)

    render({ :template => "users/show" })
  end

  def create
    the_user = user.new
    the_user.first_name = params.fetch("query_first_name")
    the_user.last_name = params.fetch("query_last_name")
    the_user.phone = params.fetch("query_phone")
    the_user.base = params.fetch("query_base")
    the_user.position = params.fetch("query_position")
    the_user.emp_id = params.fetch("query_emp_id")
    the_user.doh = params.fetch("query_doh")
    the_user.access = params.fetch("query_access")
    the_user.image = params.fetch("query_image")
    the_user.email = params.fetch("query_email")

    if the_user.valid?
      the_user.save
      redirect_to("/users", { :notice => "user created successfully." })
    else
      redirect_to("/users", { :alert => the_user.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_user = user.where({ :id => the_id }).at(0)

    the_user.first_name = params.fetch("query_first_name")
    the_user.last_name = params.fetch("query_last_name")
    the_user.phone = params.fetch("query_phone")
    the_user.base = params.fetch("query_base")
    the_user.position = params.fetch("query_position")
    the_user.emp_id = params.fetch("query_emp_id")
    the_user.doh = params.fetch("query_doh")
    the_user.access = params.fetch("query_access")
    the_user.image = params.fetch("query_image")
    the_user.email = params.fetch("query_email")

    if the_user.valid?
      the_user.save
      redirect_to("/users/#{the_user.id}", { :notice => "user updated successfully."} )
    else
      redirect_to("/users/#{the_user.id}", { :alert => the_user.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_user = User.where({ :id => the_id }).at(0)

    the_user.destroy

    redirect_to("/users", { :notice => "user deleted successfully."} )
  end
end
