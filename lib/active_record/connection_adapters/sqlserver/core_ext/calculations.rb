require 'active_record/relation'
require 'active_record/version'

module ActiveRecord
  module ConnectionAdapters
    module SQLServer
      module CoreExt
        module Calculations
          private

          def build_count_subquery(relation, column_name, distinct)
            super(relation.unscope(:order), column_name, distinct)
          end
        end
      end
    end
  end
end

ActiveSupport.on_load(:active_record) do
  mod = ActiveRecord::ConnectionAdapters::SQLServer::CoreExt::Calculations
  ActiveRecord::Relation.prepend(mod)
end
