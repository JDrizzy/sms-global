module SmsGlobal
  module Object
    module Helper
      def object(object_name, *params)
        define_method(object_name) do |argument=nil|
          object = "@#{object_name}_cache".to_sym
          if !instance_variable_defined?(object)
            instance_variable_set(object, SmsGlobal::Object.const_get("#{object_name.to_s.to_camel_case(true)}".to_sym).new(self))
          end
          instance_variable_get(object)
        end
      end
    end
  end
end