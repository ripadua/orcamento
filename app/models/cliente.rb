class Cliente < ActiveRecord::Base
  validates :nome, length: { minimum: 3 },
                   uniqueness: true  
  
  validates :cep, format: { with: /\A(\d{5})-(\d{3})/ }
  
  validates :telefone, format: { with: /\A\((\d{2})\)\s+(\d{4})-(\d{4})/ }, if: "celular.blank? && telefone.present?" 
  
  validates :celular, format: { with: /\A\((\d{2})\)\s+(\d{4})-(\d{4})/, message: "ou Telefone são obrigatórios" }, if: "telefone.blank?"
  
  validates :email, format: { with: /\A([\w\.\-]+)@([\w\.\-]+)\.([\w]+)(\.[\w])?/ }, unless: "email.blank?"
  
  has_many :orcamento
end
