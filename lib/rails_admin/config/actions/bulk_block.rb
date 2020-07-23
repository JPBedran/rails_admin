module RailsAdmin
    module Config
      module Actions
        class BulkUpdateCategory < RailsAdmin::Config::Actions::Base
          RailsAdmin::Config::Actions.register(self)
  
          register_instance_option :collection do
            true
          end
  
          register_instance_option :http_methods do
            [:post]
          end
  
          register_instance_option :controller do
            proc do
              @users = list_entries(@model_config)
              if request.params['bulk_step'].blank? # Selecting a category
                if @users.blank?
                  flash[:error] = 'No users selected to update'
                  redirect_to index_path
                else
                  render @action.template_name
                end
              elsif request.params['new_category_id'].present?
                # @new_category = Category.find(request.params['new_category_id'])
                @user_status = 
                @users.update_all(status:)
                redirect_to index_path, flash: {info: "Category updated to #{@new_category.name} for #{@users.count} users"}
              else
                  flash[:error] = 'No category selected'
                  render @action.template_name
              end
            end
          end
  
          register_instance_option :bulkable? do
            true
          end
        end
      end
    end
  end