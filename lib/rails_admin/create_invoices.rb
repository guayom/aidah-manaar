module RailsAdmin
  module Config
    module Actions
      class CreateInvoices < RailsAdmin::Config::Actions::Base
        register_instance_option :root? do
          true
        end

        register_instance_option :breadcrumb_parent do
          :dashboard
        end
      end
    end
  end
end
