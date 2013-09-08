module Users
  module ObjectCreationMethods
    def create_user(params = {})
      defaults = {
          email: "test@example.com",
          password: "password",
          password_confirmation: "password"
      }

      ::Users::User.create!(defaults.merge(params))
    end
  end
end