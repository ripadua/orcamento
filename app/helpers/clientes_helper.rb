module ClientesHelper
    
    def listar_tipos_pessoa
        [['Física', 0], ['Jurídica',1]]    
    end
    
    def listar_ufs
        ['AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MG', 'MS', 'MT', 'PA', 'PB', 'PE', 'PI', 'PR', 'RJ', 'RN', 'RO', 'RR', 'RS', 'SC', 'SE', 'SP', 'TO']
    end

    def valor_tipo_pessoa(cliente)
        cliente.pessoa_fisica? ? 'Física' : 'Jurídica'
    end
    
    def label_nome(cliente)
        cliente.pessoa_fisica? ? 'Nome' : 'Razão Social'
    end
    
    def label_documento(cliente)
        cliente.pessoa_fisica? ? 'CPF' : 'CNPJ'
    end
    
end
