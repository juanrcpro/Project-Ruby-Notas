class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :owned_tasks
  #cambiar nombre de clase
  has_many :participations, class_name: 'user_x_task'
  #alcanzar las tareas de userXtask desde usuario y no directamente las de task 
  has_many :task, through: :participations
end
