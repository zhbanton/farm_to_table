class RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)

    child_class = params[:user][:user_type].camelize.constantize
    if params[:user][:user_type] == 'farm'
      resource.rolable = child_class.new(farm_params)
    elsif params[:user][:user_type] == 'organization'
      resource.rolable = child_class.new(organization_params)
    end

    valid = resource.valid?
    valid = resource.rolable.valid? && valid

    yield resource if block_given?
    if valid && resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      @validatable = devise_mapping.validatable?
      if @validatable
        @minimum_password_length = resource_class.password_length.min
      end
      respond_with resource
    end
  end

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, bypass: true
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  private

  def sign_up_params
    user_params
  end

  def account_update_params
    user_params
  end

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation, :current_password, :name, :description, :website, :phone_number, :rolable_type, :rolable_id)
  end

  def farm_params
    params.require(:farm).permit(:minimum_order)
  end

  def organization_params
    params.require(:organization).permit(:business_type)
  end

end
