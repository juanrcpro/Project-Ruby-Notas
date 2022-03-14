# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  start_date  :date
#  end_date    :date
#  category_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Task < ApplicationRecord
  belongs_to :category
  belongs_to :owner, class_name: 'User'
  has_many :participanting_users, class_name: 'user_x_task'
  has_many :user, through: :participanting_users

  validates :participanting_users.presence :true
  
  

  validate :end_date_validity
  #metodo validar fecha futura
  def end_date_validity
    #fecha vacia 
    return if end_date.blank?
    #fecha es mayor al dia de hoy
    return if end_date > Date.today
    #si no se cumple lo de arriba da error 
    errors.add :end_date, "no correspónde" 
  end
  
end
