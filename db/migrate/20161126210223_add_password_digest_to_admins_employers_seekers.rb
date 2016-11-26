class AddPasswordDigestToAdminsEmployersSeekers < ActiveRecord::Migration
  def change
    add_column :admins, :password_digest, :string
    add_column :seekers, :password_digest, :string
    add_column :employers, :password_digest, :string
  end
end
