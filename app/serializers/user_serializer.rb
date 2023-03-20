class UserSerializer < ActiveModel::Serializer
  attributes :id,:first_name,:last_name,:mobile_number,:email, :date_of_birth,:gender,:work,:education,:address,:password
end
