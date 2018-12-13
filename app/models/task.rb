class Task < ApplicationRecord
    belongs_to :employee
    # TODO: Add all enum status needed
    enum status: [:completed, :not_started, :doing, :partial_complete]
end
