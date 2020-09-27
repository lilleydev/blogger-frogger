class AddRoles < ActiveRecord::Migration[6.0]
  def up
    %w[admin moderator poster].each do |role_name|
      Role.create! name: role_name
    end
  end

  def down
    Role.where(name: %w[admin moderator poster]).destroy_all
  end
end
