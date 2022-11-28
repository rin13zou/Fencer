# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 管理者ログイン用メールアドレスとパスワード
User.create!(name:  "フェンサー太郎",
             name_kana: "フェンサータロウ",
             user_name: "Fencer.admin",
             email: "admin@admin",
             password:  "testtest",
             password_confirmation: "testtest",
             admin: true
)