class Task < ApplicationRecord
    belongs_to :employee, optional: true
    belongs_to :company, optional: true
    # TODO: Add all enum status needed
    enum status: [:completed, :not_started, :doing, :partial_complete]
end
