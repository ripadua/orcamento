class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]
  
  require 'net/http'
  
  # GET /clientes
  # GET /clientes.json
  def index
    @clientes = Cliente.order(:nome).page params[:page]
  end

  # GET /clientes/1
  # GET /clientes/1.json
  def show
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
    @orcamento = false
  end

  def new_from_orcamento
    @cliente = Cliente.new
    @orcamento = true
    render :new
  end

  # GET /clientes/1/edit
  def edit
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)
    respond_to do |format|
      if @cliente.save
        if params[:new_from_orcamento] == 'true'
          format.html { redirect_to '/orcamentos/new/' + @cliente.id.to_s }
        else  
          format.html { redirect_to @cliente, notice: 'Cliente foi criado com sucesso.' }
          format.json { render :show, status: :created, location: @cliente }
        end
      else
        format.html { render :new }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1
  # PATCH/PUT /clientes/1.json
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        puts @cliente.data_nascimento
        format.html { redirect_to @cliente, notice: 'Cliente foi alterado com sucesso.' }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    respond_to do |format|
      if @cliente.destroy
        format.html { redirect_to clientes_url, notice: 'Cliente foi removido com sucesso.' }
        format.json { head :no_content }
      else
        format.html { redirect_to clientes_url, error: 'O cliente não pode ser removido pois existem orçamentos realizados para ele.' }
        format.json { head :no_content }
      end
    end
  end

  def consulta_cep
    cep = params[:cep].tr('-', '')
    
    source = "http://api.postmon.com.br/v1/cep/#{cep}"
    response = Net::HTTP.get_response(URI.parse(source))
    data = response.body
    
    respond_to do |format|
      if data.present?
        result = JSON.parse(data)
        format.json { render json: result }
      else
        render status: :not_found
      end
    
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_params
      params.require(:cliente).permit(:tipo_pessoa, :nome, :documento, :contato, :endereco, :complemento, :bairro, :cidade, :cep, :uf, :telefone, :celular, :data_nascimento, :email, :observacoes)
    end
end
