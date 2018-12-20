class Company < ApplicationRecord
    has_many :administrators
    has_many :tasks
    has_many :employees
end
