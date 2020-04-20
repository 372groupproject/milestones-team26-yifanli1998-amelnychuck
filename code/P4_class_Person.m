%this class defines a person, which have the properties of
%name,age,height,and weight. It contains function to set value of each
%properities and return the value of each properties.
classdef P4_class_Person
    properties
        name,age,height,weight;
    end
    methods
        function set_person(name,age,height,weight)
            obj.name = name;
            obj.age = age;
            obj.height = height;
            obj.weight = weight;
        end
        
        function name = get_name(obj)
            name = obj.name;
        end
        
        function age = get_age(obj)
            age = obj.age;
        end
        
        function height = get_height(obj)
            height = obj.height;
        end
        
        function weight = get_weight(obj)
            weight = obj.weight;
        end
        
    end
end