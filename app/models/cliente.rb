class Cliente < ActiveRecord::Base
  validates :nome, length: { minimum: 3, message: "/ Razão Social é obrigatório" }, uniqueness: true
  
  validates :cep, format: { with: /\A(\d{5})-(\d{3})/ }
  
  validates :telefone, format: { with: /\A\((\d{2})\)\s+(\d{4})-(\d{4})/ }, if: "celular.blank? && telefone.present?" 
  
  validates :celular, format: { with: /\A\((\d{2})\)\s+(\d{4})-(\d{4})/, message: "ou Telefone são obrigatórios" }, if: "telefone.blank?"
  
  validates :email, format: { with: /\A([\w\.\-]+)@([\w\.\-]+)\.([\w]+)(\.[\w])?/ }, allow_blank: true
  
  has_many :orcamento, :dependent => :restrict_with_error
  
  paginates_per 10
  
  def pessoa_fisica?
    self.tipo_pessoa == 0
  end
  
  def pessoa_juridica?
    self.tipo_pessoa == 1
  end
end
